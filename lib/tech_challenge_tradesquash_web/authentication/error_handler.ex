defmodule TechChallengeTradesquashWeb.Authentication.ErrorHandler do
  @moduledoc false
  use TechChallengeTradesquashWeb, :controller

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_flash(:error, "Authentication error.")
    |> redirect(to: Routes.session_path(conn, :new))
    |> halt()
  end
end
