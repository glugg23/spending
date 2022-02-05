defmodule SpendingWeb.UserRegistrationView do
  use SpendingWeb, :view

  @compile {:no_warn_undefined, {Routes, :user_registration_path, 2}}
end
