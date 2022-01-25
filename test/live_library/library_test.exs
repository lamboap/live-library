defmodule LiveLibrary.LibraryTest do
  use LiveLibrary.DataCase

  alias LiveLibrary.Library

  describe "authors" do
    alias LiveLibrary.Library.Author

    import LiveLibrary.LibraryFixtures

    @invalid_attrs %{first_name: nil, last_name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Library.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Library.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Author{} = author} = Library.create_author(valid_attrs)
      assert author.first_name == "some first_name"
      assert author.last_name == "some last_name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Author{} = author} = Library.update_author(author, update_attrs)
      assert author.first_name == "some updated first_name"
      assert author.last_name == "some updated last_name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_author(author, @invalid_attrs)
      assert author == Library.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Library.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Library.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Library.change_author(author)
    end
  end

  describe "books" do
    alias LiveLibrary.Library.Book

    import LiveLibrary.LibraryFixtures

    @invalid_attrs %{available: nil, cover: nil, description: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{available: true, cover: "some cover", description: "some description", title: "some title"}

      assert {:ok, %Book{} = book} = Library.create_book(valid_attrs)
      assert book.available == true
      assert book.cover == "some cover"
      assert book.description == "some description"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{available: false, cover: "some updated cover", description: "some updated description", title: "some updated title"}

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.available == false
      assert book.cover == "some updated cover"
      assert book.description == "some updated description"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end

  describe "categories" do
    alias LiveLibrary.Library.Category

    import LiveLibrary.LibraryFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Library.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Library.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Library.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Library.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_category(category, @invalid_attrs)
      assert category == Library.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Library.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Library.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Library.change_category(category)
    end
  end

  describe "book_categories" do
    alias LiveLibrary.Library.BookCategory

    import LiveLibrary.LibraryFixtures

    @invalid_attrs %{}

    test "list_book_categories/0 returns all book_categories" do
      book_category = book_category_fixture()
      assert Library.list_book_categories() == [book_category]
    end

    test "get_book_category!/1 returns the book_category with given id" do
      book_category = book_category_fixture()
      assert Library.get_book_category!(book_category.id) == book_category
    end

    test "create_book_category/1 with valid data creates a book_category" do
      valid_attrs = %{}

      assert {:ok, %BookCategory{} = book_category} = Library.create_book_category(valid_attrs)
    end

    test "create_book_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book_category(@invalid_attrs)
    end

    test "update_book_category/2 with valid data updates the book_category" do
      book_category = book_category_fixture()
      update_attrs = %{}

      assert {:ok, %BookCategory{} = book_category} = Library.update_book_category(book_category, update_attrs)
    end

    test "update_book_category/2 with invalid data returns error changeset" do
      book_category = book_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book_category(book_category, @invalid_attrs)
      assert book_category == Library.get_book_category!(book_category.id)
    end

    test "delete_book_category/1 deletes the book_category" do
      book_category = book_category_fixture()
      assert {:ok, %BookCategory{}} = Library.delete_book_category(book_category)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book_category!(book_category.id) end
    end

    test "change_book_category/1 returns a book_category changeset" do
      book_category = book_category_fixture()
      assert %Ecto.Changeset{} = Library.change_book_category(book_category)
    end
  end

  describe "book_loans" do
    alias LiveLibrary.Library.BookLoan

    import LiveLibrary.LibraryFixtures

    @invalid_attrs %{}

    test "list_book_loans/0 returns all book_loans" do
      book_loan = book_loan_fixture()
      assert Library.list_book_loans() == [book_loan]
    end

    test "get_book_loan!/1 returns the book_loan with given id" do
      book_loan = book_loan_fixture()
      assert Library.get_book_loan!(book_loan.id) == book_loan
    end

    test "create_book_loan/1 with valid data creates a book_loan" do
      valid_attrs = %{}

      assert {:ok, %BookLoan{} = book_loan} = Library.create_book_loan(valid_attrs)
    end

    test "create_book_loan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book_loan(@invalid_attrs)
    end

    test "update_book_loan/2 with valid data updates the book_loan" do
      book_loan = book_loan_fixture()
      update_attrs = %{}

      assert {:ok, %BookLoan{} = book_loan} = Library.update_book_loan(book_loan, update_attrs)
    end

    test "update_book_loan/2 with invalid data returns error changeset" do
      book_loan = book_loan_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book_loan(book_loan, @invalid_attrs)
      assert book_loan == Library.get_book_loan!(book_loan.id)
    end

    test "delete_book_loan/1 deletes the book_loan" do
      book_loan = book_loan_fixture()
      assert {:ok, %BookLoan{}} = Library.delete_book_loan(book_loan)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book_loan!(book_loan.id) end
    end

    test "change_book_loan/1 returns a book_loan changeset" do
      book_loan = book_loan_fixture()
      assert %Ecto.Changeset{} = Library.change_book_loan(book_loan)
    end
  end
end
