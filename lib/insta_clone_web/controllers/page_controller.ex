defmodule InstaCloneWeb.PageController do
  use InstaCloneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
