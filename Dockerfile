FROM ubuntu:14.04.2
#FROM gliderlabs/alpine:3.1
#RUN apk --update add git
RUN rm -rf /etc/ssh/*key*
COPY entry.sh /usr/sbin/
COPY console.sh /usr/sbin/
COPY update-ssh-keys /usr/bin/
RUN echo 'RancherOS \\n \l' > /etc/issue
RUN addgroup -g 1100 rancher && \
    addgroup -g 1101 docker && \
    addgroup -g 1103 sudo && \
    adduser -u 1100 -G rancher -D -h /home/rancher -s /bin/bash rancher && \
    sed -i 's/\(^docker.*\)/\1rancher/g' /etc/group && \
    sed -i 's/\(^sudo.*\)/\1rancher/g' /etc/group && \
    echo '%sudo ALL=(ALL) ALL' >> /etc/sudoers && \
    echo '%rancher ALL=(ALL) ALL' >> /etc/sudoers
ENTRYPOINT ["/usr/sbin/entry.sh"]
CMD ["/usr/sbin/console.sh"]
