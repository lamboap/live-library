defmodule LiveLibrary.ReviewTest do
  use LiveLibrary.DataCase

  alias LiveLibrary.Review

  describe "book_reviews" do
    alias LiveLibrary.Review.BookReview

    import LiveLibrary.ReviewFixtures

    @invalid_attrs %{image: nil, notes: nil, stars: nil}

    test "list_book_reviews/0 returns all book_reviews" do
      book_review = book_review_fixture()
      assert Review.list_book_reviews() == [book_review]
    end

    test "get_book_review!/1 returns the book_review with given id" do
      book_review = book_review_fixture()
      assert Review.get_book_review!(book_review.id) == book_review
    end

    test "create_book_review/1 with valid data creates a book_review" do
      valid_attrs = %{image: "some image", notes: "some notes", stars: 42}

      assert {:ok, %BookReview{} = book_review} = Review.create_book_review(valid_attrs)
      assert book_review.image == "some image"
      assert book_review.notes == "some notes"
      assert book_review.stars == 42
    end

    test "create_book_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Review.create_book_review(@invalid_attrs)
    end

    test "update_book_review/2 with valid data updates the book_review" do
      book_review = book_review_fixture()
      update_attrs = %{image: "some updated image", notes: "some updated notes", stars: 43}

      assert {:ok, %BookReview{} = book_review} = Review.update_book_review(book_review, update_attrs)
      assert book_review.image == "some updated image"
      assert book_review.notes == "some updated notes"
      assert book_review.stars == 43
    end

    test "update_book_review/2 with invalid data returns error changeset" do
      book_review = book_review_fixture()
      assert {:error, %Ecto.Changeset{}} = Review.update_book_review(book_review, @invalid_attrs)
      assert book_review == Review.get_book_review!(book_review.id)
    end

    test "delete_book_review/1 deletes the book_review" do
      book_review = book_review_fixture()
      assert {:ok, %BookReview{}} = Review.delete_book_review(book_review)
      assert_raise Ecto.NoResultsError, fn -> Review.get_book_review!(book_review.id) end
    end

    test "change_book_review/1 returns a book_review changeset" do
      book_review = book_review_fixture()
      assert %Ecto.Changeset{} = Review.change_book_review(book_review)
    end
  end
end
