FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential
# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
# RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs
RUN mkdir /chat_system_api
WORKDIR /chat_system_api
ENV RAILS_ENV development
COPY Gemfile /chat_system_api/Gemfile
COPY Gemfile.lock /chat_system_api/Gemfile.lock
RUN bundle install
# RUN  bundle exec rails server Puma -b 0.0.0.0 -p 3000
# RUN rails db:create
# RUN rails db:migrate
COPY . /chat_system_api

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# Start the main process.

# CMD ["rails", "s"]
# CMD ["rails", "db:create"]
# CMD ["rails", "db:migrate"]
ENTRYPOINT ["sh", "./config/docker/startup.sh"]




