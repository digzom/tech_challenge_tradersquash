defmodule TechChallengeTradesquashWeb.SessionController do
  use TechChallengeTradesquashWeb, :controller
  alias TechChallengeTradesquash.Accounts
  alias TechChallengeTradesquashWeb.Authentication

  def new(conn, _params) do
    if Authentication.get_current_account(conn) do
      redirect(conn, to: Routes.post_path(conn, :index))
    else
      render(
        conn,
        :new,
        changeset: Accounts.change_account(),
        action: Routes.session_path(conn, :create)
      )
    end
  end

  def create(conn, %{"account" => %{"email" => email, "password" => password}}) do
    case email |> Accounts.get_by_email() |> Authentication.authenticate(password) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.post_path(conn, :index))

      {:error, :invalid_credentials} ->
        conn
        |> put_flash(:error, "Incorrect email or password")
        |> new(%{})
    end
  end

  def delete(conn, _params) do
    conn
    |> Authentication.log_out()
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
