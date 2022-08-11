defmodule TechChallengeTradesquash.Author.Create do
  @moduledoc false
  alias TechChallengeTradesquash.{Repo, Author}

  def call(author) do
    author
    |> Author.build()
    |> create_author()
  end

  defp create_author({:ok, struct}), do: Repo.insert(struct)
  defp create_author({:error, _changeset} = error), do: error
end
