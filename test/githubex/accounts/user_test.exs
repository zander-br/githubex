defmodule Githubex.Accounts.UserTest do
  use Githubex.DataCase, async: true

  import Githubex.Factory

  alias Ecto.Changeset
  alias Githubex.Accounts.User

  describe "changeset/2" do
    test "when all params is valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Joe Doe"}, valid?: true} = response
    end

    test "when there is some error, returns an invalid changeset" do
      params = %{name: "Joe Doe"}

      response = User.changeset(params)

      expected_response = %{email: ["can't be blank"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
