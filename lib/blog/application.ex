defmodule Blog.Application do
  use Application

  def start(_type, _args) do

    children = [
      BlogWeb.Telemetry,
      {Phoenix.PubSub, name: Blog.PubSub},
      BlogWeb.Endpoint
    ]

    options = [strategy: :one_for_one, name: Blog.Supervisor]
    Supervisor.start_link(children, options)
  end

  def config_change(changed, _new, removed) do
    BlogWeb.Endpoint.config_change(changed, removed)
    :ok
  end

end
