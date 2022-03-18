FROM ruby:2.6.8-bullseye
  
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN gem install bundler -v 1.17.2

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -qq -y bash graphviz build-essential nodejs yarn libpq-dev 
RUN set -eux; \
	if [ -f "Gemfile" ]; then \
	bundle install && \ 
    yarn install && \
    bundle exec rails webpacker:install && \
    bundle exec rails webpacker:compile; \
	fi;
CMD ["rails", "server", "-b", "0.0.0.0"]

