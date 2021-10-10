defmodule Githubex do
  alias Githubex.Github.Client, as: GithubClient

  defdelegate get_repos_by_user(username), to: GithubClient, as: :get_repos
end
