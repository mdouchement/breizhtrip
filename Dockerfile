FROM ruby:2.3.1-alpine
MAINTAINER mdouchement, franckke

ARG BUILD_DEPENDENCIES='build-base'
ARG DEPENDENCIES='postgresql-dev libxml2-dev libxslt-dev tzdata nodejs'

# Set the locale
ENV LANG c.UTF-8

# App
ENV RAILS_ENV production
ENV RACK_ENV production
# Namespace for the application. Necessary for the asset compilation
# Update as needed
# ENV RAILS_RELATIVE_URL_ROOT /breizhtrip
ENV SECRET_KEY_BASE tmp_376ea25aaa66984733a90920c263ba138e1e571aaf3a1a54cd2b819cb06e8b7fb311027b639eb8f55d8d53c27cf2df378ceb36008462057861d824bd13a0

# Install build dependencies
RUN apk upgrade
RUN apk add --update --no-cache git bash $BUILD_DEPENDENCIES $DEPENDENCIES

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config build.nokogiri
RUN bundle config --global frozen 1
RUN bundle install --deployment --without development test

RUN bundle exec rake assets:precompile

# Clean build dependencies
RUN apk del $BUILD_DEPENDENCIES


EXPOSE 3000
CMD bundle exec rake db:migrate && \
    SECRET_KEY_BASE=$(bundle exec rake secret) \
    bundle exec puma -p 3000
