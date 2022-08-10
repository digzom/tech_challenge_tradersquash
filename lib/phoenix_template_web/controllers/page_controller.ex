defmodule PhoenixTemplateWeb.PageController do
  use PhoenixTemplateWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
