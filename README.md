# docker-lrun
Dockernize [lrun](https://github.com/quark-zju/lrun) binary

## Usage
To make a lrun, make `Dockerfile` like below.

```
FROM kyungw00k/lrun:1.1.4

# ADD NON-ROOT USER
ENV USERNAME ljudge
RUN groupadd $USERNAME \
  && useradd --gid $USERNAME --shell /bin/bash --create-home $USERNAME

# CONFIGURATION FOR RUNNING LRUN
RUN gpasswd -a $USERNAME lrun
```

and build it

```
docker build -t my-sample-docker-lrun .
```

after that run it like below

```
docker run --privileged my-sample-docker-lrun lrun
```

## Thanks to
- [@quark-zju/lrun](https://github.com/quark-zju/lrun)
