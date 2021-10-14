defmodule GithubexWeb.UserController do
  use GithubexWeb, :controller

  alias Githubex.Accounts.{User, Users}
  alias GithubexWeb.{Auth.Guardian, FallbackController}

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("show.json", token: token, user: user)
    end
  end
end
