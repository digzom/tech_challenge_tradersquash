defmodule PhoenixTemplateWeb.HelloController do
  use PhoenixTemplateWeb, :controller

  # action
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end
end
