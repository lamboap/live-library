defmodule LiveLibrary.ReviewFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveLibrary.Review` context.
  """

  @doc """
  Generate a book_review.
  """
  def book_review_fixture(attrs \\ %{}) do
    {:ok, book_review} =
      attrs
      |> Enum.into(%{
        image: "some image",
        notes: "some notes",
        stars: 42
      })
      |> LiveLibrary.Review.create_book_review()

    book_review
  end
end
