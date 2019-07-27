FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN groupadd -r regular-users 
RUN useradd -m -r -g regular-users app
USER app
RUN mkdir -p /home/app/lightblog/
WORKDIR /home/app/lightblog
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .
