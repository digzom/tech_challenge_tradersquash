defmodule TechChallengeTradesquash.Posts.Post do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias TechChallengeTradesquash.Comments.Comment

  schema "posts" do
    field :body, :string
    field :title, :string
    field :category, :string
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :category])
    |> validate_required([:title, :body, :category])
  end
end
