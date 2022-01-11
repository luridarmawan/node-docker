# Nodejs Dockerfile

Nodejs Docker

A minimal Dockerfile based on lates stable Node.js with Git installed.

## What's included

- NVM v0.39.1
- latest stable node
- yarn and npm
- Git


USAGE:

```bash
docker run -it --rm --name node -v "$PWD":/projects luri/node
```

![luri/node](docs/console.png)

---

Built by (c) Luri Darmawan and contributors. Released under the MIT license.
