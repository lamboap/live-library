defmodule LiveLibrary.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :available, :boolean, default: false
    field :cover, :string
    field :description, :string
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :available, :cover])
    |> validate_required([:title, :description, :available])
    |> unique_constraint(:author_id)
  end
end
