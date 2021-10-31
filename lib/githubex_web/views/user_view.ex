defmodule GithubexWeb.UserView do
  use GithubexWeb, :view

  alias Githubex.Accounts.User
  alias GithubexWeb.{FormatHelpers, UserView}

  def render("show.json", %{token: token, user: %User{} = user}) do
    %{"user" => Map.merge(render_one(user, UserView, "user.json"), %{"token" => token})}
  end

  def render("user.json", %{user: %User{} = user}) do
    user
    |> Map.from_struct()
    |> Map.put(:created_at, NaiveDateTime.to_iso8601(user.inserted_at))
    |> Map.take([:id, :name, :email, :created_at])
    |> FormatHelpers.camelize()
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
