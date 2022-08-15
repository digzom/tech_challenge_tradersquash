defmodule TechChallengeTradesquashWeb.AuthorController do
  use TechChallengeTradesquashWeb, :controller

  alias TechChallengeTradesquash.{Repo, Authors}
  alias TechChallengeTradesquash.Authors.Author
  alias TechChallengeTradesquash.Comments.Comment
  # alias TechChallengeTradesquashWeb.Auth.Guardian
  # alias TechChallengeTradesquash.Posts

  def index(conn, _params) do
    authors = Authors.list_authors()
    authors_list = Repo.preload(authors, [:posts])
    render(conn, "index.html", authors: authors_list)
  end

  def new(conn, _params) do
    changeset = Authors.change_author(%Author{})
    IO.inspect(changeset)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, author} <- Authors.create_author(author_params) do
      conn
      |> put_flash(:info, "You have been registered.")
      |> render("index.html", author)
    end
  end

  def show(conn, %{"id" => id}) do
    author =
      id
      |> Authors.get_author!()
      |> Repo.preload([:posts])

    changeset = Comment.changeset(%Comment{}, %{})
    render(conn, "show.html", author: author, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    author = Authors.get_author!(id)
    changeset = Authors.change_author(author)
    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Authors.get_author!(id)

    case Authors.update_author(author, author_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Author updated successfully.")

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset
    end

    redirect(conn, to: Routes.post_path(conn, :index))
  end

  def delete(conn, %{"id" => id}) do
    author = Authors.get_author!(id)
    {:ok, _author} = Authors.delete_author(author)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
