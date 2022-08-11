defmodule TechChallengeTradesquash.Repo.Migrations.CreateInitialTables do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:author, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:email, :string)
      add(:password_hash, :string)
      timestamps()
    end

    create table(:posts, primary_key: false) do
      add(:id, :id, primary_key: true)
      add(:title, :string, null: false)
      add(:slug, :string, null: false)
      add(:category, :string, null: false)
      add(:meta, :string)
      add(:author_id, references(:author, type: :uuid))

      timestamps()
    end

    create(unique_index(:posts, [:slug]))
  end
end
