defmodule TechChallengeTradesquash.Repo.Migrations.CreatePosts do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:title, :string, null: false)
      add(:body, :text, null: false)
      add(:category, :map, null: false)
      add(:slug, :string)

      timestamps()
    end

    create(unique_index(:posts, [:slug]))
  end
end
