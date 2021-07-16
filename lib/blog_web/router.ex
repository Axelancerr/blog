defmodule BlogWeb.Router do
  use BlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogWeb do
    pipe_through :browser
    get "/", IndexController, :index
  end

  import Phoenix.LiveDashboard.Router
  scope "/" do
    pipe_through :browser
    live_dashboard "/dashboard", metrics: BlogWeb.Telemetry
  end

end
