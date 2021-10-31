defmodule GithubexWeb.ReposController do
  use GithubexWeb, :controller

  alias GithubexWeb.Auth.Guardian
  alias GithubexWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"username" => username}) do
    ["Bearer " <> token] = get_req_header(conn, "authorization")

    with {:ok, repos} <- Githubex.get_repos_by_user(username),
         {:ok, _old_stuff, {refresh_token, _claims}} <- Guardian.refresh_token(token) do
      conn
      |> put_status(:ok)
      |> render("index.json", repos: repos, token: refresh_token)
    end
  end
end
