FROM elixir:1.4.5

EXPOSE 80

WORKDIR /elixir

COPY . /elixir

RUN mix deps.get
RUN mix deps.compile

CMD ["mix", "app.start"]