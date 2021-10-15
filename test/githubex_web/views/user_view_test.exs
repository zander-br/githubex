defmodule GithubexWeb.UserViewTest do
  use GithubexWeb.ConnCase, async: true

  import Phoenix.View
  import Githubex.Factory

  alias GithubexWeb.UserView

  test "renders user.json" do
    user = build(:user)

    response = render(UserView, "user.json", user: user)

    assert %{
             "id" => "33aa2742-5bf6-4d3a-9be2-6296639419b0",
             "name" => "Joe Doe",
             "email" => "joe.doe@mail.com",
             "createdAt" => "2021-10-14T08:06:05"
           } = response
  end
end
