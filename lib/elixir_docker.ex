defmodule ElixirDocker do
  @moduledoc """
  Documentation for ElixirDocker.
  """
  
  use Application
  alias Users
  require Logger

  def start(_type, _args) do
    children = [
      Supervisor.Spec.worker(ElixirDocker.Repo, []),
      Supervisor.Spec.worker(ElixirDocker.Router, [])
    ]

    Logger.info "Started application"
    # Users.count("http://jsonplaceholder.typicode.com/users")

    Supervisor.start_link(children, strategy: :one_for_one,
                          name: ElixirDocker.Supervisor)
  end
end
