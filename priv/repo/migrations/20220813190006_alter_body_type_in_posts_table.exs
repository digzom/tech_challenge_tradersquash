defmodule TechChallengeTradesquash.Repo.Migrations.AlterBodyTypeInPostsTable do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:posts, primary_key: false) do
      modify(:body, :text, null: false)
    end
  end
end
