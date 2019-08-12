FROM ubuntu:18.04
MAINTAINER uli.hitzel@gmail.com
EXPOSE 5901 6901
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Singapore

RUN apt-get update
RUN apt-get install -y xfce4
RUN apt-get install -y novnc
RUN apt-get install -y tightvncserver websockify
RUN apt-get install -y wget net-tools
ENV USER root
RUN printf "axway99\naxway99\n\n" | vncserver :1

RUN mkdir /root/stuff
WORKDIR /root/stuff
RUN wget -qO- https://github.com/novnc/noVNC/archive/v1.0.0.tar.gz | tar xz --strip 1 -C $PWD
RUN mkdir /root/stuff/utils/websockify
RUN wget -qO- https://github.com/novnc/websockify/archive/v0.6.1.tar.gz | tar xz --strip 1 -C /root/stuff/utils/websockify
#RUN ./utils/launch.sh --vnc localhost:5901 --listen 6901&

COPY start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["sh","/start.sh"]
