defmodule Namelos.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :email, :string
    field :password_hash, :string

    field :password, :string, virtual: true

    timestamps()
  end
end
