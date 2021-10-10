defmodule Githubex.Github.Client do
  use Tesla

  alias Githubex.Error
  alias Githubex.Github.Repository
  alias Tesla.Env

  plug Tesla.Middleware.Headers, [{"User-Agent", "request"}]
  plug Tesla.Middleware.JSON

  @base_url "https://api.github.com/users/"

  def get_repos(url \\ @base_url, username) do
    "#{url}#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    repos = Enum.map(body, &handle_repo/1)
    {:ok, repos}
  end

  defp handle_get({:ok, %Env{status: 404, body: _body}}) do
    {:error, Error.build_user_not_found_error()}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end

  defp handle_repo(%{
         "id" => id,
         "name" => name,
         "description" => description,
         "html_url" => html_url,
         "stargazers_count" => stargazers_count
       }) do
    Repository.build(id, name, description, html_url, stargazers_count)
  end
end
