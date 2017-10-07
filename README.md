# ElixirDocker

[![Build Status](https://travis-ci.org/AlexandruBurlacu/elixir_docker.png?branch=master)](https://travis-ci.org/AlexandruBurlacu/elixir_docker) [![Coverage Status](https://coveralls.io/repos/github/AlexandruBurlacu/elixir_docker/badge.svg?branch=master)](https://coveralls.io/github/AlexandruBurlacu/elixir_docker?branch=master) [![Ebert](https://ebertapp.io/github/AlexandruBurlacu/elixir_docker.svg)](https://ebertapp.io/github/AlexandruBurlacu/elixir_docker)

Simple ToDo REST API developed in Elixir inside a Docker container.

## Routes
***POST*** `/v1/tasks`
Creates a task and returns it's hash.

***GET*** `/v1/tasks`
Lists all available tasks.

***GET*** `/v1/tasks/{id}`
Provides information about selected task.

***PUT*** `/v1/tasks/{id}`
Updates a selected task.

***DELETE*** `/v1/tasks/{id}`
Deletes a selected task.

Initially the project was heavily inspired by [this repo](https://github.com/blackfist/tutorial_elixir_plug_ecto).
