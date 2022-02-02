defmodule Spending.Repo do
  use Ecto.Repo,
    otp_app: :spending,
    adapter: Ecto.Adapters.Postgres
end
