FROM buildpack-deps:wheezy

LABEL maintainer Kyungwook Park <parksama@gmail.com>

# INSTALL DEBIAN WHEEZY-BACKPORTS REPOSITORY
RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports.list

# UPDATE REPOSITORIES
RUN apt-get update && apt-get upgrade -y

ENV LRUN_VERSION 1.1.4

# RUNTIME DEPENDENCIES
RUN apt-get install -y libseccomp2

# INSTALL LRUN BINARY
RUN wget "https://github.com/quark-zju/lrun/releases/download/v${LRUN_VERSION}/lrun_${LRUN_VERSION}_amd64.deb" && \
    dpkg -i "lrun_${LRUN_VERSION}_amd64.deb" && \
    rm -f "lrun_${LRUN_VERSION}_amd64.deb"

# CLEAN PACKAGE ARCHIVES
RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["lrun"]
