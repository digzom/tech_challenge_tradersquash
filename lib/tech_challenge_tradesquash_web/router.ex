defmodule TechChallengeTradesquashWeb.Router do
  use TechChallengeTradesquashWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TechChallengeTradesquashWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TechChallengeTradesquashWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :guardian do
    plug TechChallengeTradesquashWeb.Authentication.Pipeline
  end

  pipeline :browser_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", TechChallengeTradesquashWeb do
    pipe_through [:browser, :guardian, :browser_auth]

    # get "/", HomeController, :index
    resources "/profile", ProfileController, only: [:show], singleton: true

    resources "/posts", PostController do
      post "/comment", PostController, :add_comment
    end

    delete "/logout", SessionController, :delete
  end

  scope "/", TechChallengeTradesquashWeb do
    pipe_through [:browser]

    get "/", HomeController, :index
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", TechChallengeTradesquashWeb do
  #   pipe_through :api
  # end

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

      live_dashboard "/dashboard", metrics: TechChallengeTradesquashWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
