defmodule ElixirDocker do
  @moduledoc """
  Entry point and handler for ElixirDocker app.
  """

  use Application
  require Logger
  import Supervisor.Spec

  def start(_type, _args) do
    children = [
      worker(ElixirDocker.Repo, []),
      worker(ElixirDocker.Router, [])
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one,
                          name: ElixirDocker.Supervisor)
  end
end
