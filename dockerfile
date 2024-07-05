FROM ubuntu
LABEL maintainer="elyar_zavvari@sfu.ca"

# Copy the packages.txt file into the Docker image
COPY packages.txt /tmp/packages.txt

# Install the packages listed in packages.txt
RUN apt-get update && xargs -a /tmp/packages.txt apt-get install -y \
    && rm -rf /var/lib/apt/lists/*


RUN apt update \
    && apt install -y build-essential \
    && mkdir -p /home/developer \
    && echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd \
    && echo "developer:x:1000:" >> /etc/group \
    && chown developer:developer -R /home/developer \
    && mkdir -p /etc/sudoers.d \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer

RUN wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2024-06/R/eclipse-cpp-2024-06-R-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q \
    && echo 'Installing eclipse' && tar -xf /tmp/eclipse.tar.gz -C /opt \
    && rm /tmp/eclipse.tar.gz && ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse 

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
