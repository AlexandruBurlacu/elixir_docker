FROM elixir:1.4.5

EXPOSE 8080

WORKDIR /elixir

COPY . /elixir

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix deps.compile && \
    mix clean && mix deps.clean --unused

CMD ["mix", "run", "--no-halt"]