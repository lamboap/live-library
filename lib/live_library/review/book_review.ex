defmodule LiveLibrary.Review.BookReview do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_reviews" do
    field :image, :string
    field :notes, :string
    field :stars, :integer
    field :user_id, :id
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_review, attrs) do
    book_review
    |> cast(attrs, [:stars, :notes, :image])
    |> validate_required([:stars])
    |> unique_constraint([:user_id, :book_id])
  end
end
