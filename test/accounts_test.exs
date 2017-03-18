defmodule Namelos.AccountsTest do
  use Namelos.DataCase

  alias Namelos.Accounts
  alias Namelos.Accounts.User

  @create_attrs %{email: "john@example.com", password: "123456"}
  @update_attrs %{email: "jane@example.com", password: "654321"}
  @invalid_attrs %{email: nil}

  def fixture(:user, attrs \\ @create_attrs) do
    {:ok, user} = Accounts.create_user(attrs)
    user
  end

  test "get_user! returns the user with given id" do
    user = fixture(:user)
    stored_user = Accounts.get_user!(user.id)
    assert stored_user.id == user.id
    assert stored_user.email == user.email
  end

  test "create_user/1 with valid data creates a user" do
    assert {:ok, %User{} = user} = Accounts.create_user(@create_attrs)
    assert user.email == "john@example.com"
  end

  test "create_user/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
  end

  test "update_user/2 with valid data updates the user" do
    user = fixture(:user)
    assert {:ok, user} = Accounts.update_user(user, @update_attrs)
    assert %User{} = user
    assert user.email == "jane@example.com"
  end

  test "update_user/2 with invalid data returns error changeset" do
    user = fixture(:user)
    assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
    updated_user = Accounts.get_user!(user.id)
    assert updated_user.email == user.email
  end

  test "delete_user/1 deletes the user" do
    user = fixture(:user)
    assert {:ok, %User{}} = Accounts.delete_user(user)
    assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
  end

  test "change_user/1 returns a user changeset" do
    user = fixture(:user)
    assert %Ecto.Changeset{} = Accounts.change_user(user)
  end
end
