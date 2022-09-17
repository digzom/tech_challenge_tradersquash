defmodule TechChallenge.PostsTest do
  @moduledoc """
  This is the test module test that we'll use to check if everything is working as expected.
  Please don't change the existing test cases, the sections allowed for modification are marked with (!).
  """

  use TechChallenge.DataCase

  test "list_posts" do
    %{id: id, title: title} = insert_post_fixture()
    assert [%{id: ^id, title: ^title}] = TechChallenge.Posts.list_posts()
  end

  test "get_post" do
    %{id: id} = insert_post_fixture()

    assert %{id: ^id, comments: [%{}], categories: categories} = TechChallenge.Posts.get_post!(id)
    assert categories |> Enum.uniq() |> Enum.count() == 2
    assert_raise Ecto.NoResultsError, fn -> TechChallenge.Posts.get_post!(0) end
  end

  test "delete_post" do
    post = insert_post_fixture()
    assert {:ok, %{}} = TechChallenge.Posts.delete_post(post)
    assert_raise Ecto.NoResultsError, fn -> TechChallenge.Posts.get_post!(post.id) end
  end

  # (!) Please change this test case to test the create_post function properly.
  test "create_post" do
    assert true == false
  end

  # (!) Please change this test case to test the update_post function properly.
  test "update_post" do
    assert true == false
  end

  # (!) You can change this function to insert data for testing.
  defp insert_post_fixture(), do: nil
end
