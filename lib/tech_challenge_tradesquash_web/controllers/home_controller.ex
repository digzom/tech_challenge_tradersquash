defmodule TechChallengeTradesquashWeb.HomeController do
  use TechChallengeTradesquashWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/login")
  end
end
