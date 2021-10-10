defmodule GithubexWeb.ReposView do
  use GithubexWeb, :view

  alias Githubex.Github.Repository

  def render("index.json", %{repos: repos}) do
    %{
      repos: Enum.map(repos, &repo_json/1)
    }
  end

  defp repo_json(%Repository{} = repo) do
    %{
      id: repo.id,
      name: repo.name,
      description: repo.description,
      html_url: repo.html_url,
      stargazers_count: repo.stargazers_count
    }
  end
end
