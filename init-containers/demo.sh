#!/bin/bash


. ../contrib/micro-demos/util.sh

desc "create new namespace"
run "kubectl create namespace demos"

desc "We will use this artifact file to create init-container"
run "cat pod.yaml"

desc "Create pod with it"
run "kubectl --namespace=demos create -f pod.yaml"

desc "See the pods created"
run "kubectl --namespace=demos get pods"

desc "Wait until this pod responds"
run "watch kubectl --namespace=demos get events"

desc "Lets expose that pod, i.e. create a service for that pod"
run "kubectl --namespace=demos expose pod init --port=80 --name=httpd"

desc "See the service created"
run "kubectl --namespace=demos get svc"

desc "Lets see if the pod has data created by init-container"
desc "curl http://httpd.demos.svc.cluster.local"
run "kubectl --namespace=demos run -it service-test \\
    --image=fedora bash"
kubectl --namespace=demos delete deployment service-test

desc "See the init container"
run "kubectl --namespace=demos get events"

