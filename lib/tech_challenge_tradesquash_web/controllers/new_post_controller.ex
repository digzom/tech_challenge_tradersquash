defmodule TechChallengeTradesquashWeb.NewPostController do
  use TechChallengeTradesquashWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", %{name: "Dickson", last_name: "Melo"})
  end
end
