defmodule LiveLibrary.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false

      timestamps()
    end

    create index(:authors, [:last_name])
    create unique_index(:authors, [:first_name, :last_name])
  end
end
