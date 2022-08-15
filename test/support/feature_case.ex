defmodule TechChallengeTradesquashWeb.FeatureCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TechChallengeTradesquash.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TechChallengeTradesquash.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(TechChallengeTradesquash.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
