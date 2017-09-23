defmodule ElixirDocker.Router do
  use Plug.Router
  import Plug.Conn

  alias Plug.Adapters.Cowboy

  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger, log: :debug
  end

  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Cowboy.http(ElixirDocker.Router, [], port: 8080)
  end

  forward "/v1/tasks", to: TasksRouter

  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Poison.encode!(%{endpoint: "not implemented!"}))
  end
end