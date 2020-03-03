# Get the base Ubuntu image from Docker Hub
FROM slmod:latest
LABEL Name=orchestradocker Version=0.0.1

# Install Orchestra
COPY ./orchestra /usr/src/orchestra
RUN tar -xzf /usr/src/orchestra/orchestra-sdk-1.8-1.x86_64.tgz --directory /usr/src/orchestra && rm -f /usr/src/orchestra/orchestra-sdk-1.8-1.x86_64.tgz
RUN mkdir /usr/src/orchestra/build && mkdir /usr/src/orchestra/source && cp -r /usr/src/orchestra/orchestra-sdk-1.8-1/Examples/* /usr/src/orchestra/source
RUN cd /usr/src/orchestra/build && cmake -D OX_INSTALL_DIRECTORY=/usr/src/orchestra/orchestra-sdk-1.8-1/ -G 'Unix Makefiles' /usr/src/orchestra/source && make

RUN yum install git -y