defmodule LiveLibraryWeb.PageController do
  use LiveLibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
