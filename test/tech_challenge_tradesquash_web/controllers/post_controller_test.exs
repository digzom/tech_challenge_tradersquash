defmodule TechChallengeTradesquashWeb.PostControllerTest do
  use TechChallengeTradesquashWeb.ConnCase

  import TechChallengeTradesquash.PostsFixtures

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  # describe "edit post" do
  #   setup [:create_post]

  #   test "renders form for editing chosen post", %{conn: conn, post: post} do
  #     conn = get(conn, Routes.post_path(conn, :edit, post))
  #     assert html_response(conn, 200) =~ "Edit Post"
  #   end
  # end
end
