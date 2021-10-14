defmodule Githubex.Accounts.UsersTest do
  use Githubex.DataCase, async: true

  import Githubex.Factory

  alias Githubex.Accounts.{User, Users}

  describe "create/1" do
    test "when all params is valid, returns the user" do
      params = build(:user_params)

      response = Users.create(params)

      assert {:ok, %User{id: _id, name: "Joe Doe", email: "joe.doe@mail.com"}} = response
    end
  end
end
