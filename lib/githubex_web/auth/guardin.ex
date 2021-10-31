defmodule GithubexWeb.Auth.Guardian do
  use Guardian, otp_app: :githubex

  alias Githubex.{Accounts.User, Accounts.Users, Error, Repo}

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => user_id}), do: {:ok, Repo.get(User, user_id)}

  def authenticate(%{"email" => email, "password" => password}) do
    with {:ok, %User{password: password_hash} = user} <- Users.get_by_email(email),
         true <- Pbkdf2.verify_pass(password, password_hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
      error -> error
    end
  end
end
