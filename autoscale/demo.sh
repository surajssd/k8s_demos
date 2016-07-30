#!/bin/bash


. ../contrib/micro-demos/util.sh

desc "create new namespace"
run "kubectl create namespace demos"

desc "Start a php based application, with resource constraints"
run "kubectl --namespace=demos run php-apache \\
    --image=gcr.io/google_containers/hpa-example \\
    --requests=cpu=500m,memory=500M --expose --port=80"

desc "See deployment created"
run "kubectl --namespace=demos get deployments"

desc "See the service created"
run "kubectl --namespace=demos get svc"

desc "See the pods created"
run "kubectl --namespace=demos get pods"

desc "Wait until this pod responds"
run "kubectl --namespace=demos get events"

desc "Lets see if the pods respond"
desc "curl http://php-apache.demos.svc.cluster.local"
run "kubectl --namespace=demos run -it service-test \\
    --image=fedora bash"
kubectl --namespace=demos delete deployment service-test

desc "Let's create a Horizontal Pod auto-scaler"
run "kubectl --namespace=demos autoscale deployment \\
     php-apache --cpu-percent=50 --min=1 --max=10"

desc "Let's increase load"
run "kubectl --namespace=demos run service-test \\
    --image=fedora -- /bin/bash -c 'while true; do \\
    curl http://php-apache.demos.svc.cluster.local; done'"
# kubectl --namespace=demos run service-test --image=fedora -- /bin/bash -c "while true;  do echo hi;  done"


#tmux new -d -s my-session \
#    "./showallpods.sh" \; \
#    split-window -h -d "./showallhpa.sh" \; \
#    attach

tmux new -d -s my-session \
    "watch kubectl --namespace=demos get hpa" \; \
    split-window -d "watch kubectl --namespace=demos get pods" \; \
    split-window -d "watch kubectl --namespace=demos get deployment php-apache" \; \
    attach

