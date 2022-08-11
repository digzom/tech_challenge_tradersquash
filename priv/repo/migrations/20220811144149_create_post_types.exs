defmodule TechChallengeTradesquash.Repo.Migrations.CreatePostTypes do
  use Ecto.Migration

  def change do
    create table(:post_types, primary_key: false) do
      add(:id, :id, primary_key: true)
      add(:title, :string, null: false)
      add(:slug, :string, null: false)
      add(:category, :string, null: false)
      add(:meta, :string)
      add(:author_id, references(:author_type))

      timestamps()
    end

    create(unique_index(:post_types, [:slug]))
  end
end
