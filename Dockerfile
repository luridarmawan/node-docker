FROM luri/free-pascal

SHELL ["/bin/bash", "-c"]

WORKDIR /projects
RUN apt update && apt install -y curl git
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
  export NVM_DIR="$HOME/.nvm" && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
  nvm install stable && \
  npm install -g yarn && \
  npm install -g node-gyp && \
  yarn set version berry && \
  rm -rf package.json && \
  rm -r /tmp/*
