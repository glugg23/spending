defmodule Spending.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def up do
    create table(:categories) do
      add :name, :string

      timestamps()
    end

    create unique_index(:categories, [:name])

    flush()

    if Mix.env() !== :test do
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Other"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Bills"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Home & Garden"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Eating Out"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Transport"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Shopping"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Entertainment"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Health & Beauty"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Groceries"})
      Spending.Repo.insert!(%Spending.Transactions.Category{name: "Income"})
    end
  end

  def down do
    drop index(:categories, [:name])
    drop table(:categories)
  end
end
