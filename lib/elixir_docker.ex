defmodule ElixirDocker do
  @moduledoc """
  Documentation for ElixirDocker.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirDocker.hello
      Hello World

  """
  use Application
  require Logger

  def hello do
    "Hello World"
  end

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ElixirDocker.PlugExample,
      [], port: 8080)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
