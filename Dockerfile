# ./Dockerfile
# Elixir base image to start with
FROM elixir:1.11

# install psql dependency
RUN apt-get update && \
  apt-get install -y postgresql-client

# install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# # install the latest Phoenix
# # RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force
# RUN wget https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
# RUN mix archive.install ./phoenix_new.ez

# # install NodeJS and NPM
# RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
# RUN bash nodesource_setup.sh
# RUN apt-get install nodejs
# RUN apt-get install -y inotify-tools

# create our app folder and copy our code in it and set it as default
RUN mkdir /app
COPY . /app
WORKDIR /app

# install dependencies
RUN mix deps.get

# run phoenix server. The CMD is run each time the container is launched.
CMD mix phx.server