FROM ubuntu:22.04

ADD configure.sh /configure.sh
ADD home.tar.gz /home
COPY script /tmp
RUN apt update -y \
	&& apt upgrade -y \
	&& chmod +x /tmp/bin \
	&& mv /tmp/bin/* /usr/bin \
	&& DEBIAN_FRONTEND=noninteractive apt install -y bash wget screen curl net-tools vim ffmpeg tmux php aria2 mediainfo transmission transmission-daemon\
	&& mkdir -p /run/screen \
	&& chmod -R 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /usr/bin/frpc \
	&& chmod +x /usr/bin/ttyd	
ENV LANG C.UTF-8
WORKDIR /home
CMD /configure.sh
