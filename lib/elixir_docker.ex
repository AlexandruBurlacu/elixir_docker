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
  alias Plug.Adapters.Cowboy
  require Logger

  def hello do
    "Hello World"
  end

  def start(_type, _args) do
    children = [
      Cowboy.child_spec(:http, ElixirDocker.Router, [], port: 8081)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
