FROM python:3.7

ENV K8S_VERSION=v1.18.12
ENV HELM_FILENAME=helm-v3.4.1-linux-amd64.tar.gz


RUN apt -y update \
  && apt -y install ca-certificates \ 
  && apt -y install curl build-essential  \
  && apt -y install gettext tar gzip \
  && curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && curl -L https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
  && chmod +x /usr/local/bin/kubectl 

RUN pip3 install uvloop

CMD ["helm"]
