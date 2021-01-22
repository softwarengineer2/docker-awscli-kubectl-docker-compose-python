FROM docker

# Install python, pip, curl, gcc etc.
RUN apk add --no-cache ca-certificates curl zlib libgcc \
		python3-dev py3-pip gcc py-pip python2-dev \
		musl-dev libffi-dev openssl openssl-dev make

#Install awscli & docker-compose
RUN pip3 install --upgrade awscli docker-compose

#Install kubectl
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt -O -)/bin/linux/amd64/kubectl -O kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN mkdir -p ~/.kube

# Sets default path
ENV PATH="${PATH:-/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin}"