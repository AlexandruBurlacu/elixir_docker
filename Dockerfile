FROM elixir:1.4.5

EXPOSE 8080

ENV MIX_ENV prod

RUN mix local.hex --force && \
    mix local.rebar --force 
 
WORKDIR /elixir_docker
ADD . .

RUN mix deps.get && \
    mix deps.compile && \
    mix clean && mix deps.clean --unused

CMD ["mix", "run", "--no-halt"]
