defmodule SpendingWeb.LayoutView do
  use SpendingWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  @compile {:no_warn_undefined, {Routes, :user_registration_path, 2}}
end
