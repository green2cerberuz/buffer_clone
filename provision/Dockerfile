FROM ruby:2.7.3-alpine


ARG USER_ID
ARG GROUP_ID

ENV HOME /usr/src
WORKDIR $HOME

RUN apk update && apk add \
    git \
    make \
    build-base \
    postgresql-dev \
    gcc \ 
    tzdata

COPY ./Gemfile Gemfile.loc[k] rubocop.yml docker_entrypoint.sh  $HOME/

# # Install gems
RUN bundle install

RUN addgroup -g $GROUP_ID ruby_group && adduser -DH -g '' -u $USER_ID -G ruby_group ruby_user \
    && chmod +x docker_entrypoint.sh

COPY --chown=ruby_user . $HOME

USER ruby_user

ENTRYPOINT ["/usr/src/docker_entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]


