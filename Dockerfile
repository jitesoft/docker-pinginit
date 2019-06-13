FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/pinginit" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/pinginit/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/pinginit" \
      com.jitesoft.app.pinginit.version="1.0.0-rc1"

ADD ./ping.sh /usr/bin/pinginit
RUN chmod +x /usr/bin/pinginit
