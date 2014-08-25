FROM heroku/cedar:14

RUN apt-get install -y vim
RUN adduser --disabled-password --home=/hdev --uid 9999 hdev

RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
RUN wget -O- https://toolbelt.heroku.com/apt/release.key | apt-key add -
RUN apt-get update
RUN apt-get install -y heroku-toolbelt

WORKDIR /hdev
ENV HOME /hdev
USER hdev
