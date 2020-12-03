FROM lwolf/helm-kubectl-docker:v1.18.12-v3.4.1
    
RUN apk add --update python3 \
&& apk add --update git \
&& apk add --update --virtual build-deps gcc python3-dev musl-dev \
&& apk add --update alpine-sdk \
&& rm /var/cache/apk/*

RUN pip3 install uvloop

CMD ["helm"]
