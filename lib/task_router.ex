defmodule ElixirDocker.Router.TasksRouter do
  @moduledoc """
  Special purpose router to handle
  CRUD operations over 'tasks' in the TODO API.
  """

  use Plug.Router

  alias ElixirDocker.Record
  alias ElixirDocker.Repo

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  defp response(connection, code, data) do
    connection
    |> put_resp_content_type("application/json")
    |> send_resp(code, Poison.encode!(data))
  end

  defp valid_data?(data) do
    ["title", "description", "due_date", "priority"]
    |> Enum.map(fn k ->
      data
      |> Map.has_key?(k)
    end)
    |> Enum.all?
  end

  post "/" do
    data = conn.body_params

    if (valid_data?(data)) do

      record = %Record{title: data["title"],
                       description: data["description"],
                       due_date: Date.from_iso8601!(data["due_date"]),
                       priority: data["priority"]}

      resp = Repo.insert! record

      conn |> response(201, %{info: "Task created", task_id: resp.id})
    else
      conn |> response(400, %{info: "Invalid body"})
    end
  end

  get "/" do
    conn
    |> response(200, %{info: "Welcome from listing",
                          data: [%{no: "posts"}, %{no: "posts"}]})
  end

  get "/:id" do
    conn
    |> response(200, %{info: "Welcome from details",
                          data: %{no: "info on #{id}"}})
  end

  put "/:id" do
    conn
    |> response(200, %{info: "Welcome from update",
                          data: %{no: "way to update #{id}"}})
  end

  delete "/:id" do
    conn
    |> response(200, %{info: "Welcome from delete",
                          data: %{no: "way to delete #{id}"}})
  end
end
