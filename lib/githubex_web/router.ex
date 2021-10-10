defmodule GithubexWeb.Router do
  use GithubexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GithubexWeb do
    pipe_through :api

    get "/repos/:username", ReposController, :index
  end
end
