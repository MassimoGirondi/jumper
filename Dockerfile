
FROM alpine:edge

ENV HOME /home/jumper

RUN apk add --no-cache openssh pwgen busybox-suid sudo openssh-server-pam

RUN adduser -D -h $HOME jumper 
#RUN adduser jumper sudo
RUN echo 'jumper ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chown -R jumper:jumper $HOME

# ssh configuration
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /
RUN mkdir $HOME/.ssh &&\
	chmod 700 -R $HOME/.ssh/ &&\
	chown jumper -R $HOME/.ssh

WORKDIR $HOME

USER jumper

EXPOSE 2222

ENTRYPOINT /entrypoint.sh
