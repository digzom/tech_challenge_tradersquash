defmodule TechChallengeTradesquash.Accounts do
  @moduledoc false
  alias TechChallengeTradesquash.{Repo, Accounts.Account}

  def register(%Ueberauth.Auth{} = params) do
    %Account{}
    |> Account.changeset(extract_account_params(params))
    |> Repo.insert()
  end

  defp extract_account_params(%{credentials: %{other: other}, info: info}) do
    info
    |> Map.from_struct()
    |> Map.merge(other)
  end

  def change_account(account \\ %Account{}) do
    Account.changeset(account, %{})
  end

  def get_account(id) do
    Repo.get(Account, id)
  end

  def get_by_email(email) do
    Repo.get_by!(Account, email: email)
  end
end
