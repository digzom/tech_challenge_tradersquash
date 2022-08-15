defmodule TechChallengeTradesquash.Repo.Migrations.CreateAccounts do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:name, :string)
      add(:email, :string)
      add(:encrypted_password, :string)

      timestamps()
    end

    create(unique_index(:accounts, [:email]))
  end
end
