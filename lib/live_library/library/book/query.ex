defmodule LiveLibrary.Library.Book.Query do
  import Ecto.Query
  alias LiveLibrary.Library.Book
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
end
