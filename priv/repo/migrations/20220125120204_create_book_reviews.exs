defmodule LiveLibrary.Repo.Migrations.CreateBookReviews do
  use Ecto.Migration

  def change do
    create table(:book_reviews) do
      add :stars, :integer, null: false
      add :notes, :text
      add :image, :string
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :book_id, references(:books, on_delete: :nothing), null: false

      timestamps()
    end

    create unique_index(:book_reviews, [:user_id, :book_id])
  end
end
