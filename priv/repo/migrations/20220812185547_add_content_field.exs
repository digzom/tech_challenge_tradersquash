defmodule TechChallengeTradesquash.Repo.Migrations.AddContentField do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:posts, primary_key: false) do
      add(:content, :string, null: false)
    end
  end
end
