defmodule TechChallengeTradesquash.AuthorType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "author_types" do


    timestamps()
  end

  @doc false
  def changeset(author_type, attrs) do
    author_type
    |> cast(attrs, [])
    |> validate_required([])
  end
end
