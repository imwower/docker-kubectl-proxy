#!/bin/bash

TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

kubectl --server=${APISERVER} \
	--token=${TOKEN} \
	--insecure-skip-tls-verify proxy \
	--port=${PORT} \
	--address="0.0.0.0" \
	--disable-filter=true
