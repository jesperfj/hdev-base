FROM heroku/cedar:14
RUN apt-get install -y vim
RUN adduser --disabled-password --home=/hdev --uid 9999 hdev

RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
RUN wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
RUN apt-get update
RUN apt-get install -y heroku-toolbelt bash-completion
RUN git config --system credential.helper store
ADD bash.bashrc.patch /etc/bash.bashrc.patch
RUN patch /etc/bash.bashrc < /etc/bash.bashrc.patch

WORKDIR /hdev
ENV HOME /hdev
USER hdev

