FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /shorten_url
WORKDIR /shorten_url

ADD Gemfile /shorten_url/Gemfile
ADD Gemfile.lock /shorten_url/Gemfile.lock

RUN bundle install

ADD . /shorten_url
