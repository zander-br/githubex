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

    test "when there is invalid params, returns an error" do
      params = %{name: "Joe Doe"}

      response = User.changeset(params)

      expected_response = %{email: ["can't be blank"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
