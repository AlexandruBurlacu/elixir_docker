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
  alias Users
  require Logger

  def hello do
    "Hello World"
  end

  def start(_type, _args) do
    children = [
      Supervisor.Spec.worker(ElixirDocker.Repo, []),
      Supervisor.Spec.worker(ElixirDocker.Router, [])
    ]

    # Logger.info "Started application"
    # Logger.info Users.count("http://jsonplaceholder.typicode.com/users")

    Supervisor.start_link(children, strategy: :one_for_one,
                          name: ElixirDocker.Supervisor)
  end
end
