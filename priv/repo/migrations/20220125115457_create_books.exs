defmodule LiveLibrary.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :description, :text
      add :available, :boolean, default: true, null: false
      add :cover, :string
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:books, [:author_id])
    create index(:books, [:title])
    create index(:books, [:available])
  end
end
