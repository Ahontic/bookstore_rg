# Stage: Builder
FROM ruby:2.7.2-alpine3.11 as Builder

RUN apk add --update --no-cache \
    build-base libxml2-dev libxslt-dev git imagemagick tzdata curl nano wget unzip \
    postgresql-dev yarn nodejs

ENV APP_HOME /home/www/bookstore

WORKDIR $APP_HOME

COPY Gemfile* package.json yarn.lock .ruby-version ./

RUN bundle check || bundle install --without development test -j $(nproc) --retry 5 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

RUN yarn install --production

COPY . $APP_HOME

ARG FOG_DIRECTORY
ENV FOG_DIRECTORY $FOG_DIRECTORY

RUN RAILS_ENV=staging rails assets:precompile

RUN rm -rf app/assets/images node_modules spec vendor/assets public/uploads tmp/cache

RUN rm $(ls -d $APP_HOME/config/credentials/* | grep -v 'staging')

# Stage: Final
FROM ruby:2.7.2-alpine3.11

RUN apk add --update --no-cache libxml2-dev libxslt-dev \
    postgresql-dev file tzdata curl nodejs bash imagemagick git unzip

ENV APP_USER app
ENV APP_HOME /home/www/bookstore

RUN addgroup -g 1000 -S $APP_USER && adduser -u 1000 -S $APP_USER -G $APP_USER

USER $APP_USER

ARG FOG_DIRECTORY
ENV FOG_DIRECTORY $FOG_DIRECTORY

ARG RUNNING_TAG
ENV SKYLIGHT_ENV $RUNNING_TAG

ARG BASE_HOST_URL
ENV BASE_HOST_URL $BASE_HOST_URL

ARG GIT_SHA
ENV GIT_SHA $GIT_SHA
ARG GIT_ID
ENV GIT_ID $GIT_ID

COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app $APP_HOME $APP_HOME

WORKDIR $APP_HOME
