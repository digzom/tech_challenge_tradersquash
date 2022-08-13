defmodule TechChallengeTradesquash.Authors.Author do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias TechChallengeTradesquash.Posts.Post

  @fields [:name, :email, :password, :password_hash]
  @required_fields [:name, :email, :password]
  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "authors" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :posts, Post

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(post \\ %__MODULE__{}, attrs) do
    post
    |> cast(attrs, @fields)
    |> validate_length(:password, min: 4)
    |> validate_required(@required_fields)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
