defmodule ElixirDocker.Record do
  use Ecto.Schema

  schema "tasks" do
    field :title, :string
    field :description, :string
    field :due_date, Ecto.Date
    field :priority, :string

    timestamps()
  end
end
