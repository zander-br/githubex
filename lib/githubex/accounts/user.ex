defmodule Githubex.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(name email password)a

  schema "users" do
    field :name, :string
    field :email, :string, unique: true
    field :password, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
  end
end
