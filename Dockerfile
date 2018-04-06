FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp
COPY Gemfile.lock /myapp

RUN bundle install
COPY . /myapp

EXPOSE 3000
