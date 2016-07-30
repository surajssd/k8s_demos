#!/bin/bash


. ../contrib/micro-demos/util.sh

desc "Lets create demo namespace"
run "kubectl create namespace demos"

desc "Job artifact looks like this"
run "cat jobs.yaml"

desc "Read more about jobs using"
run "kubectl explain jobs.spec"

desc "Create job using that artifact file"
run "kubectl --namespace=demos create -f jobs.yaml"

desc "See the job created"
run "kubectl --namespace=demos get jobs"

desc "See more info about that specific job"
run "kubectl --namespace=demos describe jobs/pi"

desc "See if you can find it in pod"
run "kubectl --namespace=demos get pods"

desc "See what all events occurred"
run "watch kubectl --namespace=demos get events"

desc "See that exited pod"
run "kubectl --namespace=demos get pods --show-all"

desc "See what did that job do?"
pod=$(kubectl --namespace=demos get pods --show-all | grep pi | awk '{print $1}')
run "kubectl --namespace=demos logs $pod"

