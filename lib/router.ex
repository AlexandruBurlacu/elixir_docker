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

  get "/v1/tasks" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  get "/v1/tasks/{id}" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  post "/v1/tasks" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  put "/v1/tasks/{id}" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  delete "/v1/tasks/{id}" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{data: "Nothing to show"}))
  end

  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Poison.encode!(%{endpoint: "not implemented!"}))
  end
end
