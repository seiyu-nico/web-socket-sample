FROM node:20.3-bullseye-slim
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

WORKDIR /src

RUN npm install -g laravel-echo-server

ARG UID
ARG GID
ENV UID ${UID}
ENV GID ${GID}
ENV USER dev

RUN groupadd --force -g ${GID} ${USER} && \
    usermod -l ${USER} node && \
    # useradd --force -ms /bin/bash --no-user-group -g ${GID} ${USER} && \
    chown -R ${USER}:${USER} /src
USER ${USER}

CMD ["laravel-echo-server", "start"]
