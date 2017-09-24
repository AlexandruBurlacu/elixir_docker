defmodule ElixirDocker.Record do
  @moduledoc """
  Describes the 'tasks' table in the Database.
  """

  use Ecto.Schema

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, :date
    field :priority, :string

    timestamps()
  end
end
