# ElixirDocker

[![Build Status](https://travis-ci.org/AlexandruBurlacu/elixir_docker.png?branch=master)](https://travis-ci.org/AlexandruBurlacu/elixir_docker) [![Coverage Status](https://coveralls.io/repos/github/AlexandruBurlacu/elixir_docker/badge.svg?branch=master)](https://coveralls.io/github/AlexandruBurlacu/elixir_docker?branch=master)

An API developed in Elixir inside a Docker container. For the sake of learning. Eventually I may try Docker's FaaS, but for now let's keep things simple.

Even if Travis says that build is failing, it acctually works and the issue is in the configuration of the `.travis.yml` file. With a working Postgres database and adjusted `config.exs` file, all tests should pass.
