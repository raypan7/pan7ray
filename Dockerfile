FROM ruby:2.6.6-stretch

MAINTAINER Ray Pan <ray727035@gmail.com>

ENV LANG="C.UTF-8" INSTALL_PATH=/pan7ray

# Set OpenSSL SECLEVEL to 1
RUN sed -i.bak -e 's/SECLEVEL=2/SECLEVEL=1/' /usr/lib/ssl/openssl.cnf

RUN set -ex; \
    apt-get update; \
    apt-get upgrade -qq -y; \
    apt-get install -qq -y --no-install-recommends apt-transport-https; \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -; \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    apt-get update; \
    apt-get install -qq -y --no-install-recommends \
      build-essential \
      libpq-dev \
      nodejs \
      vim \
      default-mysql-client \
      fonts-wqy-zenhei \
      imagemagick \
      yarn; \
    apt-get -q clean; \
    rm -rf /var/lib/apt/lists/* \
    && mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY ./Gemfile $INSTALL_PATH/Gemfile

COPY ./Gemfile.lock $INSTALL_PATH/Gemfile.lock

RUN gem install bundler

RUN bundle install

COPY package.json yarn.lock $INSTALL_PATH/

RUN yarn install

COPY . .