defmodule GithubexWeb.ChangesetView do
  use GithubexWeb, :view

  alias Ecto.Changeset

  def render("error.json", %{changeset: changeset}) do
    %{errors: translate_errors(changeset)}
  end

  defp translate_errors(changeset) do
    Changeset.traverse_errors(changeset, &translate_error/1)
  end
end
