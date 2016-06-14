# kubectl proxy command in a docker container
# This container expects 
#     * to run in a k8s cluster
#     * /var/run/secrets/kubernetes.io/serviceaccount/token to exist
# To run it, 
#     * Edit the kubectl-proxy-rc.yaml with your API Server endpoint
#     * Deploy the service and the replication controller
# By default, all your containers can now talk to the Kubernetes API 
# on http://kubectl-proxy.default.svc.cluster.local:8080/api

FROM ubuntu:16.04

ENV KUBECTL_VERSION 1.2.4

MAINTAINER Samuel Cozannet <samuel.cozannet@madeden.com>

COPY kubectl /usr/bin/kubectl
COPY run.sh /usr/bin/run.sh

RUN chmod +x /usr/bin/kubectl /usr/bin/run.sh

ENV APISERVER http://localhost:8080
ENV PORT 8080

EXPOSE ${PORT}

CMD [ "/usr/bin/run.sh"]