defmodule ElixirDocker.Repo.Migrations.ChangeSchema do
  use Ecto.Migration

  def change do
    drop table(:records)
    
    create table(:tasks) do
      add :title, :string
      add :description, :string
      add :due_date, :date
      add :priority, :string
  
      timestamps
    end
  end
end
