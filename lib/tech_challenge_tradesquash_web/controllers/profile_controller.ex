defmodule TechChallengeTradesquashWeb.ProfileController do
  use TechChallengeTradesquashWeb, :controller
  alias TechChallengeTradesquashWeb.Authentication

  def show(conn, _params) do
    current_account = Authentication.get_current_account(conn)
    render(conn, :show, current_account: current_account)
  end
end
