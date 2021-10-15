defmodule GithubexWeb.FormatHelpersTest do
  use Githubex.DataCase, async: true

  alias GithubexWeb.FormatHelpers

  describe "camelize/1" do
    test "when there is a key atom type in snake_case, it must be transformed into camel case" do
      params = %{name: "Joe Doe", user_name: "joe.doe"}

      result = FormatHelpers.camelize(params)

      expected_result = %{"name" => "Joe Doe", "userName" => "joe.doe"}

      assert result == expected_result
    end
  end
end
