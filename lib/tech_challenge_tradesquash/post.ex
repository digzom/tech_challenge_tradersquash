defmodule TechChallengeTradesquash.Post do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :category, :string
    field :content, :string
    field :meta, :string
    belongs_to :author, TechChallengeTradesquash.Author

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  @fields [:title, :slug, :category, :meta, :content, :author_id]
  @required_fields [:title, :slug, :category, :author_id, :content]

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    # preventing runtime errors and converting them into validation errors
    |> unique_constraint(:slug, name: "post_slug_index")
  end
end
