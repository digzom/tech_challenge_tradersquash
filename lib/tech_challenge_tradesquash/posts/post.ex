defmodule TechChallengeTradesquash.Posts.Post do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias TechChallengeTradesquash.Comments.Comment
  alias TechChallengeTradesquash.Authors.Author

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type Ecto.UUID

  @fields [:title, :body, :category, :slug, :author_id]
  @required_fields [:title, :body, :category]

  schema "posts" do
    field :body, :string
    field :title, :string
    field :category, :string
    field :slug, :string
    has_many :comments, Comment
    belongs_to :author, Author

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
    |> validate_required(@required_fields)
    |> add_slug()
    # preventing runtime errors and converting them into validation errors
    |> unique_constraint(:slug, name: "post_slug_index")
  end

  defp add_slug(%Ecto.Changeset{valid?: true, changes: %{title: title}} = changeset) do
    change(changeset, slug: create_slug(title))
  end

  defp add_slug(changeset), do: changeset

  defp create_slug(title) do
    slug =
      title
      |> String.downcase()
      # remove special characters
      |> String.replace(~r/[^a-z0-9\s-]/, "")
      # replace space with dashes
      |> String.replace(~r/(\s|-)+/, "-")

    slug
  end
end
