defmodule LiveLibrary.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias LiveLibrary.Library.Author

  schema "books" do
    field :available, :boolean, default: true
    field :cover, :string
    field :description, :string
    field :title, :string
    belongs_to :author, Author
    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :available, :cover, :author_id])
    |> validate_required([:title, :description, :available, :author_id])
    |> unique_constraint(:author_id)
  end
end
