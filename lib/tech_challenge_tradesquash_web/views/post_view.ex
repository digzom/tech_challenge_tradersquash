defmodule TechChallengeTradesquashWeb.PostView do
  use TechChallengeTradesquashWeb, :view
  alias TechChallengeTradesquash.Posts
  alias Earmark.Options

  def get_comments_count(post_id) do
    Posts.get_number_of_comments(post_id)
  end

  def html_view(markdown) do
    markdown
    |> Earmark.as_html!(%Options{escape: true})
    |> raw
  end
end
