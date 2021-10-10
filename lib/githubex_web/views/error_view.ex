defmodule GithubexWeb.ErrorView do
  use GithubexWeb, :view

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{result: result}), do: %{message: result}
end
