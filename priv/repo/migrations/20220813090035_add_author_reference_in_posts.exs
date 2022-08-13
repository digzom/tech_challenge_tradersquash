defmodule TechChallengeTradesquash.Repo.Migrations.AddAuthorReferenceInPosts do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:posts, primary_key: false) do
      add(:author_id, references(:authors, type: :uuid))
    end
  end
end
