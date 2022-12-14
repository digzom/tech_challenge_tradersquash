defmodule TechChallengeTradesquash.Posts do
  @moduledoc false
  import Ecto.Query, warn: false
  alias TechChallengeTradesquash.Repo

  alias TechChallengeTradesquash.Posts.Post
  alias TechChallengeTradesquash.Comments

  def list_posts do
    Repo.all(Post)
  end

  def get_post!(id), do: Repo.get!(Post, id) |> Repo.preload([:account])

  def create_post(attrs \\ %{}, id) do
    %Post{}
    |> Map.replace(:account_id, id)
    |> check_if_anon_is_marked(attrs)
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  defp check_if_anon_is_marked(changeset, %{"anon" => "true"}) do
    Map.replace(changeset, :account_id, nil)
  end

  defp check_if_anon_is_marked(changeset, _attrs) do
    changeset
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def add_comment(post_id, comment_params) do
    comment_params
    |> Map.put("post_id", post_id)
    |> Comments.create_comment()
  end

  def get_number_of_comments(post_id) do
    post = __MODULE__.get_post!(post_id) |> Repo.preload([:comments])
    Enum.count(post.comments)
  end
end
