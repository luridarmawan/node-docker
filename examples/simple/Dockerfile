FROM luri/node

# default to port 3000 for node, and 4001 and 4002 (tests) for debug
ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 4001 4002

SHELL ["/bin/bash", "-c"]

WORKDIR /projects
COPY . .
RUN cd app && yarn

CMD ["node", "app/app.js"]
