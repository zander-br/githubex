defmodule Githubex.Factory do
  use ExMachina.Ecto, repo: Githubex.Repo

  alias Githubex.Accounts.User

  def user_params_factory do
    %{
      "name" => "Joe Doe",
      "email" => "joe.doe@mail.com",
      "password" => "valid_password"
    }
  end

  def user_factory do
    %User{
      email: "joe.doe@mail.com",
      id: "33aa2742-5bf6-4d3a-9be2-6296639419b0",
      inserted_at: ~N[2021-10-14 08:06:05],
      name: "Joe Doe",
      password: "hash_password",
      updated_at: ~N[2021-10-14 08:06:05]
    }
  end
end
