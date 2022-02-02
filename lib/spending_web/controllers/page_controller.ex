defmodule SpendingWeb.PageController do
  use SpendingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
