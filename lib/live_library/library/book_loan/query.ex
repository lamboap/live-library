defmodule LiveLibrary.Library.BookLoan.Query do
  import Ecto.Query
  alias LiveLibrary.Library.BookLoan

  def base do
    BookLoan
  end

  def preload_user(user) do
    base()
    |> for_user(user)
  end

  defp for_user(query, user) do
    query
    |> where([r], r.user_id == ^user.id)
  end
end
