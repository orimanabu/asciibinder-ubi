FROM registry.access.redhat.com/ubi9-minimal as builder
ENV LANG C.UTF-8
RUN microdnf install -y make gcc gcc-c++ ruby ruby-devel
RUN gem install listen asciidoctor asciidoctor-diagram ascii_binder

FROM registry.access.redhat.com/ubi9-minimal
ENV LANG C.UTF-8
RUN microdnf update -y && microdnf install -y ruby git && microdnf clean all
COPY --from=builder /usr/local /usr/local
WORKDIR /docs
LABEL url="http://www.asciibinder.org" \
      summary="Asciibinder builder" \
      description="Run the asciibinder container image from the local docs repo, which is mounted into the container. Pass asciibinder commands to run the build. Generated files are owned by root." \
      RUN="podman run --rm -it -v `pwd`:/docs:Z IMAGE asciibinder build"
