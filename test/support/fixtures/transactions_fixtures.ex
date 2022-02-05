defmodule Spending.TransactionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spending.Transactions` context.
  """

  @doc """
  Generate a unique category name.
  """
  def unique_category_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: unique_category_name()
      })
      |> Spending.Transactions.create_category()

    category
  end
end
