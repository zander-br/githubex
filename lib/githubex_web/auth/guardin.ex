defmodule GithubexWeb.Auth.Guardian do
  use Guardian, otp_app: :githubex

  alias Githubex.{Accounts.User, Repo}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => user_id}), do: {:ok, Repo.get(User, user_id)}
end
