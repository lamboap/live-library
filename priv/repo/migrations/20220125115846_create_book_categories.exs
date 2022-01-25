defmodule LiveLibrary.Repo.Migrations.CreateBookCategories do
  use Ecto.Migration

  def change do
    create table(:book_categories) do
      add :book_id, references(:books, on_delete: :nothing), null: false
      add :category_id, references(:categories, on_delete: :nothing), null: false

      timestamps()
    end

    create unique_index(:book_categories, [:category_id, :book_id])
  end
end
