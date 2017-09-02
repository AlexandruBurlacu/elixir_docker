defmodule ElixirDocker.Router do
  use Plug.Router
  import Plug.Conn

  alias ElixirDocker.Record
  alias ElixirDocker.Repo
  alias Plug.Adapters.Cowboy

  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Cowboy.http(ElixirDocker.Router, [], port: 8080)
  end

  get "/status" do
    last_run = Record |> Ecto.Query.last |> Repo.one

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{last_run: last_run.inserted_at,
                                       result_count: last_run.count}))
  end

  match _ do
    conn
    |> send_resp(404, Poison.encode!(%{endpoint: "not implemented!"}))
  end
end
