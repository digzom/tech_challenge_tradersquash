defmodule TechChallengeTradesquash.Repo.Migrations.CreatePosts do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add(:id, :id, primary_key: true)
      add(:title, :string, null: false)
      add(:slug, :string, null: false)
      add(:category, :string, null: false)
      add(:meta, :string)
      add(:author_id, references(:author))

      timestamps()
    end

    create(unique_index(:post, [:slug]))
  end
end
