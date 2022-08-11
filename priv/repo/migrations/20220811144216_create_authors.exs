defmodule TechChallengeTradesquash.Repo.Migrations.CreateAuthors do
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
  end
end
