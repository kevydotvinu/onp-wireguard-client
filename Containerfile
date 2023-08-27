FROM alpine

LABEL maintainer="Vinu K <vkochuku@redhat.com>" \
      description="A container image for the wireguard service of the OpenShift Network Playground."

WORKDIR /workdir

ADD run.sh .

RUN  apk -U upgrade && \
     apk add --no-cache wireguard-tools

ENTRYPOINT ["/workdir/run.sh"]
