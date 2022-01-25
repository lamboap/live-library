defmodule LiveLibrary.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveLibrary.Library` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> LiveLibrary.Library.create_author()

    author
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        available: true,
        cover: "some cover",
        description: "some description",
        title: "some title"
      })
      |> LiveLibrary.Library.create_book()

    book
  end

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> LiveLibrary.Library.create_category()

    category
  end

  @doc """
  Generate a book_category.
  """
  def book_category_fixture(attrs \\ %{}) do
    {:ok, book_category} =
      attrs
      |> Enum.into(%{

      })
      |> LiveLibrary.Library.create_book_category()

    book_category
  end

  @doc """
  Generate a book_loan.
  """
  def book_loan_fixture(attrs \\ %{}) do
    {:ok, book_loan} =
      attrs
      |> Enum.into(%{

      })
      |> LiveLibrary.Library.create_book_loan()

    book_loan
  end
end
