defmodule ElixirDocker.Router.TasksRouter do
  @moduledoc """
  Special purpose router to handle
  CRUD operations over 'tasks' in the TODO API.
  """

  use Plug.Router
  require Logger

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  defp common_behaviour(connection, data) do
    connection
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(data))
  end

  post "/" do
    conn
    |> common_behaviour(%{info: "Welcome from post",
                          data: conn.body_params})
  end

  get "/" do
    conn
    |> common_behaviour(%{info: "Welcome from listing",
                          data: [%{no: "posts"}, %{no: "posts"}]})
  end

  get "/:id" do
    conn
    |> common_behaviour(%{info: "Welcome from details",
                          data: %{no: "info on #{id}"}})
  end

  put "/:id" do
    conn
    |> common_behaviour(%{info: "Welcome from update",
                          data: %{no: "way to update #{id}"}})
  end

  delete "/:id" do
    conn
    |> common_behaviour(%{info: "Welcome from delete",
                          data: %{no: "way to delete #{id}"}})
  end
end
