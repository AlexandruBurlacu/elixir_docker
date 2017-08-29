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
  import Users
  require Logger

  def hello do
    "Hello World"
  end

  def start(_type, _args) do
    children = [
      Cowboy.child_spec(:http, ElixirDocker.Router, [], port: 8080)
    ]

    Logger.info "Started application"
    Logger.info Users.count

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
