defmodule TechChallengeTradesquash.Accounts.Account do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string

    timestamps()
  end

  @doc false
  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_confirmation(:password, required: true)
    |> unique_constraint(:email)
    |> put_encrypted_password()
  end

  defp put_encrypted_password(%{valid?: true, changes: %{password: pw}} = changeset) do
    put_change(changeset, :encrypted_password, Argon2.hash_pwd_salt(pw))
  end

  defp put_encrypted_password(changeset) do
    changeset
  end
end
