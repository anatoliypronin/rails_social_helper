FROM ruby:2.6.3

ADD . /app
WORKDIR /app

RUN mkdir -p /app && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get install -y nodejs && \
  npm install webpack yarn -g

RUN bundle install --jobs 4 --no-binstubs && \
  yarn install && \
  bin/rake assets:precompile NODE_ENV=production RAILS_ENV=production && \
  bin/rake webpacker:compile NODE_ENV=production RAILS_ENV=production

 EXPOSE 8080