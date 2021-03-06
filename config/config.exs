# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aws_warehouse,
  ecto_repos: [AwsWarehouse.Repo]

# Configures the endpoint
config :aws_warehouse, AwsWarehouseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5jH2wbfMpyo9VLvCMlxUVaBIQZlsVEGE6dK4ITsqXUyfOzKAk2oH0WpwsV4W9fwW",
  render_errors: [view: AwsWarehouseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AwsWarehouse.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "MY8uOr/+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
