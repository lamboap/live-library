defmodule LiveLibrary.Review do
  @moduledoc """
  The Review context.
  """

  import Ecto.Query, warn: false
  alias LiveLibrary.Repo

  alias LiveLibrary.Review.BookReview
  alias LiveLibrary.Library

  @doc """
  Returns the list of book_reviews.

  ## Examples

      iex> list_book_reviews()
      [%BookReview{}, ...]

  """
  def list_book_reviews do
    Repo.all(BookReview)
  end

  @doc """
  Gets a single book_review.

  Raises `Ecto.NoResultsError` if the Book review does not exist.

  ## Examples

      iex> get_book_review!(123)
      %BookReview{}

      iex> get_book_review!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_review!(id), do: Repo.get!(BookReview, id)

  @doc """
  Creates a book_review.

  ## Examples

      iex> create_book_review(%{field: value})
      {:ok, %BookReview{}}

      iex> create_book_review(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_review(attrs \\ %{}) do
    %BookReview{}
    |> BookReview.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_review.

  ## Examples

      iex> update_book_review(book_review, %{field: new_value})
      {:ok, %BookReview{}}

      iex> update_book_review(book_review, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_review(%BookReview{} = book_review, attrs) do
    book_review
    |> BookReview.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_review.

  ## Examples

      iex> delete_book_review(book_review)
      {:ok, %BookReview{}}

      iex> delete_book_review(book_review)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_review(%BookReview{} = book_review) do
    Repo.delete(book_review)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_review changes.

  ## Examples

      iex> change_book_review(book_review)
      %Ecto.Changeset{data: %BookReview{}}

  """
  def change_book_review(%BookReview{} = book_review, attrs \\ %{}) do
    BookReview.changeset(book_review, attrs)
  end

  def books_with_average_reviews do
    Library.Book.Query.with_average_reviews()
    |> Repo.all()
  end
end
