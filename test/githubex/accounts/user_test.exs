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
  end
end
