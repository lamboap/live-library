defmodule LiveLibrary.Library.Book.Query do
  import Ecto.Query
  alias LiveLibrary.Library.{Book, Category, BookCategory, Author}
  alias LiveLibrary.Library.BookLoan

  def base, do: Book

  def with_user_loans(user, query \\ base()) do
    query
    |> preload_user_loans(user)
  end

  defp preload_user_loans(query, user) do
    loans_query = BookLoan.Query.preload_user(user)

    query
    |> preload(loans: ^loans_query)
  end

  def with_average_reviews(query \\ base()) do
    query
    |> join_reviews
    |> average_reviews
  end

  defp join_reviews(query) do
    query
    |> join(:inner, [b], r in BookReview, on: r.book_id == b.id)
  end

  defp average_reviews(query) do
    query
    |> group_by([b], b.id)
    |> select([b, r], {b.name, fragment("?::float", avg(r.stars))})
  end

  def with_title(query \\ base(), attrs)
  def with_title(query, %{title: title}) do
    match = "%#{title}%"
    query
    |> where([b], ilike(b.title, ^match))
  end

  def with_title(query, _), do: query

  def with_availability(query \\ base(), attrs)
  def with_availability(query, %{available: nil}), do: query
  def with_availability(query, %{available: available}) do
    query
    |> where([b], b.available == ^available)
  end


  def with_categories(query \\ base(), attrs)
  def with_categories(query, %{categories: nil}), do: query
  def with_categories(query, %{categories: categories}) do
    query
    |> join_categories
    |> where([b, bc, c], c.name in ^categories)
  end

  defp join_categories(query) do
    query
    |> join(:inner, [b], bc in BookCategory, on: bc.book_id == b.id)
    |> join(:inner, [b, bc], c in Category, on: bc.category_id == c.id)
  end

  def with_author_last_name(query \\ base(), attrs)
  def with_author_last_name(query, %{author_last_name: nil}), do: query
  def with_author_last_name(query, %{author_last_name: author_last_name}) do
    match = "%#{author_last_name}%"
    query
    |> join_authors
    |> where([b, a], ilike(a.last_name, ^match))
  end


  defp join_authors(query) do
    query
    |> join(:inner, [b], a in Author, on: b.author_id == a.id)
  end
end
