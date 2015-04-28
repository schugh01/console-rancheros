FROM tatsushid/tinycore:6.1-x86_64  
RUN tce-load -wic git
RUN rm -rf /etc/ssh/*key*
COPY entry.sh /usr/sbin/
COPY console.sh /usr/sbin/
COPY update-ssh-keys /usr/bin/
RUN echo 'RancherOS \\n \l' > /etc/issue
RUN addgroup -g 1100 rancher && \
    addgroup -g 1101 docker && \
    adduser -u 1100 -G rancher -D -h /home/rancher -s /bin/bash rancher && \
    echo '## allow password less for rancher user' >> /etc/sudoers && \
    echo 'rancher ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ENTRYPOINT ["/usr/sbin/entry.sh"]
CMD ["/usr/sbin/console.sh"]
