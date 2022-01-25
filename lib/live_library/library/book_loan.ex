defmodule LiveLibrary.Library.BookLoan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_loans" do

    field :user_id, :id
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_loan, attrs) do
    book_loan
    |> cast(attrs, [])
    |> validate_required([:user_id, :book_id])
    |> unique_constraint([:user_id, :book_id])
  end
end
