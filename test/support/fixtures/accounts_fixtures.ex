defmodule Spending.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spending.Accounts` context.
  """

  def unique_user_name, do: "user#{System.unique_integer()}"
  def valid_user_password, do: "Password123+"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: unique_user_name(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Spending.Accounts.register_user()

    user
  end
end
