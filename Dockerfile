FROM ubuntu:20.04

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev libtool libssl-dev libevent-dev libzmq3-dev\
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /

# COPY binary
COPY bin/ /usr/local/bin
# COPY default conf mvc.conf
COPY bin/mvc.conf /root/.mvc/mvc.conf

EXPOSE 9882 9883 9332 9333 28332 28333
CMD ["mvcd"]