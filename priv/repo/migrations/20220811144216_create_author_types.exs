defmodule TechChallengeTradesquash.Repo.Migrations.CreateAuthorTypes do
  use Ecto.Migration

  def change do
    create table(:author_types) do

      timestamps()
    end
  end
end
