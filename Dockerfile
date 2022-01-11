FROM luri/free-pascal

ARG NODE_VERSION=v17.3.1
ENV NODE_VERSION $NODE_VERSION

SHELL ["/bin/bash", "-c"]

WORKDIR /projects
RUN apt update && apt install -y curl git
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
  export NVM_DIR="$HOME/.nvm" && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
  nvm install $NODE_VERSION && \
  npm install -g yarn && \
  npm install -g node-gyp && \
  yarn set version berry && \
  node -v > node_version && \
  rm -rf package.json && \
  rm -r /tmp/*
ENV NVM_DIR="/root/.nvm"
ENV PATH=/root/.nvm/versions/node/$NODE_VERSION/bin:$PATH
