defmodule LiveLibrary.Library.BookCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_categories" do

    field :book_id, :id
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_category, attrs) do
    book_category
    |> cast(attrs, [:book_id, :category_id])
    |> validate_required([:book_id, :category_id])
    |> unique_constraint([:category_id, :book_id])
    |> foreign_key_constraint(:book_id)
    |> foreign_key_constraint(:category_id)
  end
end
