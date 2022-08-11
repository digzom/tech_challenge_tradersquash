defmodule TechChallengeTradesquash.PostType do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type :id

  schema "post_types" do
    field :title, :string
    field :slug, :string
    field :category, :string
    field :meta, :string
    belongs_to :author, TechChallengeTradesquash.AuthorType

    timestamps()
  end

  @fields ~w(title slug category meta author_id)
  @required_fields ~w(title slug category author_id)

  def changeset(post_type, attrs) do
    post_type
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
    # preventing runtime errors and converting them into validation errors
    |> unique_constraint(:slug, name: "post_type_slug_index")
  end
end
