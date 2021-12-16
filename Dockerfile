FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai
RUN apt-get update && apt-get install -y --no-install-recommends \
    tigervnc-standalone-server autocutsel \
    xfce4 xfce4-terminal openssh-server supervisor \
    procps \
    dbus-x11 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
COPY passwd xstartup /root/.vnc/
COPY entrypoint.sh /root/
COPY supervisord.conf /etc/supervisor/conf.d/
EXPOSE 5901 22
ENTRYPOINT [ "/root/entrypoint.sh" ]