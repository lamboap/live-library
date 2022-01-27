defmodule LiveLibrary.Library.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveLibrary.Library.Book

  schema "authors" do
    field :first_name, :string
    field :last_name, :string
    has_many :books, Book
    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
    |> unique_constraint([:first_name, :last_name])
  end
end
