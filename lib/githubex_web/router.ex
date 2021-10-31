defmodule GithubexWeb.Router do
  use GithubexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug GithubexWeb.Auth.Pipeline
  end

  scope "/api", GithubexWeb do
    pipe_through [:api, :auth]

    get "/repos/:username", ReposController, :index
  end

  scope "/api", GithubexWeb do
    pipe_through :api

    post "/users", UserController, :create
    post "/users/signin", UserController, :sign_in
  end
end
