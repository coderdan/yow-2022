defmodule CloakDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CloakDemo.Repo,
      # Start the Telemetry supervisor
      CloakDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CloakDemo.PubSub},
      # Start the Endpoint (http/https)
      CloakDemoWeb.Endpoint,
      CloakDemo.Vault
      # Start a worker by calling: CloakDemo.Worker.start_link(arg)
      # {CloakDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CloakDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CloakDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
