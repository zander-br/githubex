defmodule GithubexWeb.UserControllerTest do
  use GithubexWeb.ConnCase, async: true

  import Githubex.Factory

  describe "create/2" do
    test "when all params is valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "user" => %{
                 "id" => _id,
                 "name" => "Joe Doe",
                 "email" => "joe.doe@mail.com",
                 "createdAt" => _created_at,
                 "token" => _token
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "name" => "Joe Doe",
        "email" => "joe.doe@mail.com"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:unprocessable_entity)

      expected_response = %{"errors" => %{"password" => ["can't be blank"]}}

      assert response == expected_response
    end
  end
end
