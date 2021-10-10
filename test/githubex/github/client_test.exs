defmodule Githubex.Github.ClientTest do
  use ExUnit.Case, async: true

  alias Githubex.Github.{Client, Repository}
  alias Plug.Conn

  describe "get_repos/1" do
    setup do
      bypass = Bypass.open()
      {:ok, bypass: bypass}
    end

    test "when there is a valid username, returns the repos", %{bypass: bypass} do
      username = "zander-br"

      url = endpoint_url(bypass.port)

      body = ~s([
        {
          "description": "Application of studies for ONGs to inform your needs.",
          "html_url": "https://github.com/zander-br/be-the-hero",
          "id": 250313580,
          "name": "be-the-hero",
          "stargazers_count": 1
        },
        {
          "description": null,
          "html_url": "https://github.com/zander-br/clean-code-and-clean-architecture-ts",
          "id": 368825827,
          "name": "clean-code-and-clean-architecture-ts",
          "stargazers_count": 0
        }
      ])

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_repos(url, username)

      expected_response =
        {:ok,
         [
           %Repository{
             description: "Application of studies for ONGs to inform your needs.",
             html_url: "https://github.com/zander-br/be-the-hero",
             id: 250_313_580,
             name: "be-the-hero",
             stargazers_count: 1
           },
           %Repository{
             description: nil,
             html_url: "https://github.com/zander-br/clean-code-and-clean-architecture-ts",
             id: 368_825_827,
             name: "clean-code-and-clean-architecture-ts",
             stargazers_count: 0
           }
         ]}

      assert response == expected_response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
