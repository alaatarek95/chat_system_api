FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs netcat


RUN mkdir /chat_system_api

WORKDIR /chat_system_api

ENV RAILS_ENV development

COPY Gemfile /chat_system_api/Gemfile

COPY Gemfile.lock /chat_system_api/Gemfile.lock

RUN bundle install

COPY . /chat_system_api

ENTRYPOINT ["sh", "./config/docker/startup.sh"]




