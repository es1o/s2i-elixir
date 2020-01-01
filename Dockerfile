FROM elixir:1.9.4-slim

LABEL io.k8s.description="Platform for building and running a elixir app" \
      io.k8s.display-name="build-elixir" \
      io.openshift.expose-services="4000:http" \
      io.openshift.tags="builder,elixir,phoenix" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV LANG en_US.UTF-8
ENV HOME /opt/app-root

COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p /opt/app-root && chown -R 1001:1001 /opt/app-root

USER 1001

EXPOSE 4000

WORKDIR /opt/app-root
