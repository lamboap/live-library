defmodule LiveLibrary.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias LiveLibrary.Repo
  alias LiveLibrary.Library
  alias LiveLibrary.Library.Author
  alias LiveLibrary.Library.Book
  alias LiveLibrary.Library.Category
  alias LiveLibrary.Library.BookCategory
  alias LiveLibrary.Library.BookLoan


  def checkout_book(book, user_id) do
    with {:ok, _loan} <- Library.create_book_loan(%{user_id: user_id, book_id: book.id}),
         {:ok, book}  <- Library.update_book(book, %{available: false})
    do
      {:ok, book}
    else
      err -> err
    end
  end

  def return_book(book) do
    with {:ok, _loan} <- Library.update_book_loan(List.first(book.loans), %{active: false}),
         {:ok, book}  <- Library.update_book(book, %{available: true})
    do
      {:ok, book}
    else
      err -> err
    end
  end

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(Author)
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{data: %Author{}}

  """
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  def list_books(user) do
    Book.Query.with_user_loans(user)
    |> Repo.all()
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  @doc """
  Returns the list of book_categories.

  ## Examples

      iex> list_book_categories()
      [%BookCategory{}, ...]

  """
  def list_book_categories do
    Repo.all(BookCategory)
  end

  @doc """
  Gets a single book_category.

  Raises `Ecto.NoResultsError` if the Book category does not exist.

  ## Examples

      iex> get_book_category!(123)
      %BookCategory{}

      iex> get_book_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_category!(id), do: Repo.get!(BookCategory, id)

  @doc """
  Creates a book_category.

  ## Examples

      iex> create_book_category(%{field: value})
      {:ok, %BookCategory{}}

      iex> create_book_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_category(attrs \\ %{}) do
    %BookCategory{}
    |> BookCategory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_category.

  ## Examples

      iex> update_book_category(book_category, %{field: new_value})
      {:ok, %BookCategory{}}

      iex> update_book_category(book_category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_category(%BookCategory{} = book_category, attrs) do
    book_category
    |> BookCategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_category.

  ## Examples

      iex> delete_book_category(book_category)
      {:ok, %BookCategory{}}

      iex> delete_book_category(book_category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_category(%BookCategory{} = book_category) do
    Repo.delete(book_category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_category changes.

  ## Examples

      iex> change_book_category(book_category)
      %Ecto.Changeset{data: %BookCategory{}}

  """
  def change_book_category(%BookCategory{} = book_category, attrs \\ %{}) do
    BookCategory.changeset(book_category, attrs)
  end

  @doc """
  Returns the list of book_loans.

  ## Examples

      iex> list_book_loans()
      [%BookLoan{}, ...]

  """
  def list_book_loans do
    Repo.all(BookLoan)
  end

  @doc """
  Gets a single book_loan.

  Raises `Ecto.NoResultsError` if the Book loan does not exist.

  ## Examples

      iex> get_book_loan!(123)
      %BookLoan{}

      iex> get_book_loan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_loan!(id), do: Repo.get!(BookLoan, id)

  @doc """
  Creates a book_loan.

  ## Examples

      iex> create_book_loan(%{field: value})
      {:ok, %BookLoan{}}

      iex> create_book_loan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book_loan(attrs \\ %{}) do
    %BookLoan{}
    |> BookLoan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book_loan.

  ## Examples

      iex> update_book_loan(book_loan, %{field: new_value})
      {:ok, %BookLoan{}}

      iex> update_book_loan(book_loan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book_loan(%BookLoan{} = book_loan, attrs) do
    book_loan
    |> BookLoan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book_loan.

  ## Examples

      iex> delete_book_loan(book_loan)
      {:ok, %BookLoan{}}

      iex> delete_book_loan(book_loan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book_loan(%BookLoan{} = book_loan) do
    Repo.delete(book_loan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book_loan changes.

  ## Examples

      iex> change_book_loan(book_loan)
      %Ecto.Changeset{data: %BookLoan{}}

  """
  def change_book_loan(%BookLoan{} = book_loan, attrs \\ %{}) do
    BookLoan.changeset(book_loan, attrs)
  end
end
