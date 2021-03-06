FROM ubuntu:18.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y \
		wget \
		curl \
		git \
		jq \
		ssh \
		sshpass \
	; \
	rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
	curl https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | bash; \
	wget https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 -O /usr/bin/yq; chmod +x /usr/bin/yq;

WORKDIR /usr/src

ENTRYPOINT ["sh"]
CMD ["--help"]
