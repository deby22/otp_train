defmodule Railroad.Repo.Migrations.CreateBarriers do
  use Ecto.Migration

  def change do
    create table(:barriers) do
      add :name, :string
      add :status, :string

      timestamps()
    end

    create unique_index(:barriers, [:name])
  end
end
