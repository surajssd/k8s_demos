#!/bin/bash


. ../contrib/micro-demos/util.sh

desc "create new namespace"
run "kubectl create namespace demos"

desc "Using this artifact file"
run "cat ./artifacts.yaml"

desc "Create a service and Petset"
run "kubectl --namespace=demos create -f artifacts.yaml"

desc "See all the pods created"
run "watch kubectl --namespace=demos get pods"

desc "Get more info from service"
run "kubectl --namespace=demos describe svc httpd"

desc "Get the endpoints"
run "kubectl --namespace=demos get ep"

desc "Lets see if it is accessible from within cluster"
desc "curl http://httpd-0.httpd.demos.svc.cluster.local"
run "kubectl --namespace=demos run -it service-test \\
    --image=fedora bash"
