defmodule TechChallengeTradesquashWeb.RegistrationController do
  use TechChallengeTradesquashWeb, :controller
  alias TechChallengeTradesquash.Accounts
  alias TechChallengeTradesquashWeb.Authentication
  plug Ueberauth

  def create(%{assigns: %{ueberauth_auth: auth_params}} = conn, _params) do
    case Accounts.register(auth_params) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.post_path(conn, :index))

      {:error, changeset} ->
        render(conn, :new,
          changeset: changeset,
          action: Routes.registration_path(conn, :create)
        )
    end
  end

  def new(conn, _) do
    if Authentication.get_current_account(conn) do
      redirect(conn, to: Routes.post_path(conn, :show))
    else
      render(
        conn,
        :new,
        changeset: Accounts.change_account(),
        action: Routes.registration_path(conn, :create)
      )
    end
  end
end
