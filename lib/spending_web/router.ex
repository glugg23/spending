defmodule SpendingWeb.Router do
  use SpendingWeb, :router

  import SpendingWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SpendingWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  scope "/", SpendingWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/transactions", SpendingWeb do
    pipe_through [:browser, :require_authenticated_user]

    resources "/categories", CategoryController
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SpendingWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", SpendingWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
  end

  if Mix.env() in [:dev, :test] do
    scope "/", SpendingWeb do
      pipe_through [:browser, :redirect_if_user_is_authenticated]

      get "/users/register", UserRegistrationController, :new
      post "/users/register", UserRegistrationController, :create
    end
  end

  scope "/", SpendingWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
  end

  scope "/", SpendingWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
  end
end
