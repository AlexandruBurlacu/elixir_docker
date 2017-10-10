defmodule ElixirDocker.Router.TasksRouter do
  @moduledoc """
  Special purpose router to handle
  CRUD operations over 'tasks' in the ToDo API.
  """

  use Plug.Router
  import Ecto.Query

  alias ElixirDocker.Record
  alias ElixirDocker.Repo
  alias Ecto.Adapters.SQL

  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass:  ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  def response(connection, code, data) do
    connection
    |> put_resp_content_type("application/json")
    |> send_resp(code, Poison.encode!(data))
  end

  def valid_data?(data) do
    ["title", "description", "due_date", "priority"]
    |> Enum.map(fn k ->
      data
      |> Map.has_key?(k)
    end)
    |> Enum.all?
  end

  def stringify_dates(raw_data) do
    raw_data |> Enum.map(fn record ->
      {{y, m, d}, _} = record.inserted_at
      {due_y, due_m, due_d} = record.due_date

      record
      |> Map.put(:inserted_at, "#{y}-#{m}-#{d}")
      |> Map.put(:due_date, "#{due_y}-#{due_m}-#{due_d}")
    end)
  end

  post "/" do
    data = conn.body_params

    case (valid_data?(data)) do
      true  -> record = %Record{title: data["title"],
                                description: data["description"],
                                due_date: Date.from_iso8601!(data["due_date"]),
                                priority: data["priority"]}

               resp = Repo.insert! record

               conn |> response(201, %{info: "Task created", task_id: resp.id})
      false -> conn |> response(400, %{info: "Invalid body"})
      _     -> conn |> response(404, %{info: "Something strange has happened"})
    end
  end

  post "/:id" do
    conn
    |> response(405,
       %{info: "Impossible to update tasks via POST, use PUT instead"})
  end

  get "/" do
    data = Repo.all(from t in "tasks",
                    select: [:title, :description,
                            :due_date, :priority,
                            :inserted_at, :id])
    case (data) do
      [] -> conn |> response(404, %{info: "No available tasks"})
      _  -> conn |> response(200, %{info: "The available tasks",
                                    data: stringify_dates(data)})
    end
  end

  get "/:id" do
    data = Repo.all(from t in "tasks",
                    where: t.id == ^String.to_integer(id),
                    select: [:title, :description,
                             :due_date, :priority,
                             :inserted_at])

    case (data) do
      [] -> conn |> response(404, %{info: "No information about tasks ##{id}"})
      _  -> conn |> response(200, %{info: "Information about tasks ##{id}",
                                    data: stringify_dates(data)})
    end
  end

  put "/" do
    conn |> response(405, %{info: "Impossible to update all tasks"})
  end

  put "/:id" do
    data = conn.body_params

    case (valid_data?(data)) do
      true  -> from(t in "tasks",
                    where: t.id == ^String.to_integer(id),
                    update: [set:
                              [title: ^data["title"],
                               description: ^data["description"],
                               due_date: ^Date.from_iso8601!(data["due_date"]),
                               priority: ^data["priority"]]
                            ])
               |> Repo.update_all([])

               conn |> response(200, %{info: "Task ##{id} updated"})
      false -> conn |> response(400, %{info: "Invalid body"})
      _     -> conn |> response(404, %{info: "Something strange has happened"})
    end
  end

  delete "/" do
    conn |> response(405, %{info: "Impossible to delete all tasks"})
  end

  delete "/:id" do
    stats = SQL.query(Repo,
      "DELETE FROM tasks WHERE id = $1", [String.to_integer id])

    case (stats) do
      {:ok, _}    -> conn |> response(200, %{info: "Task ##{id} deleted"})
      {:error, _} -> conn |> response(700, %{info: "Task ##{id} not deleted"})
    end
  end
end
