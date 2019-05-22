FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft - https://jitesoft.com" \
      maintainer.repo="https://gitlab.com/jitesoft/dockerfiles/pinginit" \
      maintainer.issues="https://gitlab.com/jitesoft/dockerfiles/pinginit/issues"

ADD ./ping.sh /usr/bin/pinginit
RUN chmod +x /usr/bin/pinginit
