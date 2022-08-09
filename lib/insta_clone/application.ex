defmodule InstaClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      InstaClone.Repo,
      # Start the Telemetry supervisor
      InstaCloneWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: InstaClone.PubSub},
      # Start the Endpoint (http/https)
      InstaCloneWeb.Endpoint
      # Start a worker by calling: InstaClone.Worker.start_link(arg)
      # {InstaClone.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InstaClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InstaCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
