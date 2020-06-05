FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

RUN mkdir /docker-rails
WORKDIR /docker-rails

ADD Gemfile /docker-rails/Gemfile
ADD Gemfile.lock /docker-rails/Gemfile.lock
RUN gem install yarn 
RUN gem install bundler:2.1.4

RUN bundle install

ADD . /docker-rails
