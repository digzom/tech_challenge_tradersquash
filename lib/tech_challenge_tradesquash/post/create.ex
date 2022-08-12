defmodule TechChallengeTradesquash.Post.Create do
  @moduledoc false
  alias TechChallengeTradesquash.{Repo, Post}

  def call(post) do
    post
    |> Post.build()
    |> create_post()
  end

  defp create_post({:ok, struct}), do: Repo.insert!(struct)
  defp create_post({:error, _changeset} = error), do: error
end
