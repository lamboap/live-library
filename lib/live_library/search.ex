defmodule LiveLibrary.Search do
  alias LiveLibrary.Search.Criteria
  alias LiveLibrary.Library.Book
  alias LiveLibrary.Repo

  def change_criteria(%Criteria{} = criteria, attrs \\ %{}) do
    Criteria.changeset(criteria, attrs)
  end

  def search(criteria) do
    Book.Query.with_title(criteria)
    |> Book.Query.with_availability(criteria)
    |> Book.Query.with_author_last_name(criteria)
    |> Book.Query.with_categories(criteria)
    |> Repo.all()
  end
end
