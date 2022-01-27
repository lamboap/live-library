defmodule LiveLibraryWeb.BookLive.Index do
  use LiveLibraryWeb, :live_view

  alias LiveLibrary.Library

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :books, Library.list_books())}
  end
end
