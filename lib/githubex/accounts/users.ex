defmodule Githubex.Accounts.Users do
  import Ecto.Changeset

  alias Githubex.Accounts.User
  alias Githubex.Repo

  def create(params) do
    params
    |> User.changeset()
    |> hash_password()
    |> Repo.insert()
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset

  defp hash_password(%{valid?: true} = changeset) do
    password =
      changeset
      |> get_field(:password)
      |> Pbkdf2.hash_pwd_salt()

    put_change(changeset, :password, password)
  end
end
