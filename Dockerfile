FROM ruby:3.0

RUN apt-get update -qq \
 && apt-get install -y nodejs npm \
 && rm -rf /var/lib/apt/lists/* \
 && npm install --global yarn

ENV APP /app
RUN mkdir -p $APP
COPY . $APP/

WORKDIR $APP

RUN mkdir -p tmp/sockets && \
    mkdir -p /tmp/public && \
    cp -rf $APP/public/* /tmp/public

RUN bundle install
