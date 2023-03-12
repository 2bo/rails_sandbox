FROM ruby:3.2.1-slim-buster

ENV RUBY_YJIT_ENABLE=1

WORKDIR /myapp

RUN apt-get update && apt-get install -y curl build-essential git sqlite3 libsqlite3-dev
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

RUN gem install bundler
COPY Gemfile* /myapp/
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
