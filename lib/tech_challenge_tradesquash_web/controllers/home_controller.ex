defmodule TechChallengeTradesquashWeb.HomeController do
  use TechChallengeTradesquashWeb, :controller

  def index(conn, _params) do
    render(conn, "<div>ok</div>")
  end
end
