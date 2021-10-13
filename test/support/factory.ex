defmodule Githubex.Factory do
  use ExMachina.Ecto, repo: Githubex.Repo

  def user_params_factory do
    %{
      "name" => "Joe Doe",
      "email" => "joe.doe@mail.com",
      "password" => "valid_password"
    }
  end
end
