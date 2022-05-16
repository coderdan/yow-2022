# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cloak_demo,
  ecto_repos: [CloakDemo.Repo]

# Configures the endpoint
config :cloak_demo, CloakDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mvsYJi2OirG6VOfiQcptI0OLDQh2g+1FSckc8O1oSPdV3RTwDVkXDruc8kDetoXw",
  render_errors: [view: CloakDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CloakDemo.PubSub,
  live_view: [signing_salt: "eh6HlB9i"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
