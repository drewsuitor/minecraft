#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: shell
spec:
  containers:
  - name: gsutil
    image: gcr.io/cloud-builders/gsutil:latest
    command: ["/bin/sleep"]
    args:
    - "100000"
    volumeMounts:
    - name: minecraft-map
      mountPath: "/home/minecraft/server"
      readOnly: false
  volumes:
  - name: minecraft-map
    persistentVolumeClaim:
      claimName: minecraft-map-volume
EOF
