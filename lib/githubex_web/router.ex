defmodule GithubexWeb.Router do
  use GithubexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GithubexWeb do
    pipe_through :api

    get "/repos/:username", ReposController, :index

    post "/users", UserController, :create
    post "/users/signin", UserController, :sign_in
  end
end
