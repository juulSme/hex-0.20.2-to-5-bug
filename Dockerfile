FROM elixir:1.9-alpine

WORKDIR /application
ADD . .

RUN \
  apk add --no-cache --update git && \
  # does not work with 0.20.2-5
  # mix archive.install --force github hexpm/hex tag v0.20.1 && \
  mix archive.install --force github hexpm/hex tag v0.20.5 && \
  mix local.rebar --force && \
  mix deps.get