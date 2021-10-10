defmodule GithubexWeb.ReposController do
  use GithubexWeb, :controller

  alias GithubexWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"username" => username}) do
    with {:ok, repos} <- Githubex.get_repos_by_user(username) do
      conn
      |> put_status(:ok)
      |> render("index.json", repos: repos)
    end
  end
end
