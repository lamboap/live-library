defmodule LiveLibrary.Repo.Migrations.CreateBookLoans do
  use Ecto.Migration

  def change do
    create table(:book_loans) do
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :book_id, references(:books, on_delete: :nothing), null: false
      add :active, :boolean, default: true, null: false

      timestamps()
    end

    create unique_index(:book_loans, [:user_id, :book_id])
  end
end
