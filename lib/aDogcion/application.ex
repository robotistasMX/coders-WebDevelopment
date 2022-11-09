defmodule ADogcion.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ADogcion.Repo,
      # Start the Telemetry supervisor
      ADogcionWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ADogcion.PubSub},
      # Start the Endpoint (http/https)
      ADogcionWeb.Endpoint
      # Start a worker by calling: ADogcion.Worker.start_link(arg)
      # {ADogcion.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ADogcion.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ADogcionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
