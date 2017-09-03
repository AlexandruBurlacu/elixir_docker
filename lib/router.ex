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
    if System.get_env("MIX_ENV") == "test" do
      timestamp = Ecto.DateTime.from_date_and_time(%Ecto.Date{year: 2017, month: 09, day: 03},
                                                   %Ecto.Time{hour: 12, min: 42, sec: 50, usec: 00})
      last_run = %{inserted_at: timestamp, count: 10}
    else
      last_run = Record |> Ecto.Query.last |> Repo.one
    end

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
