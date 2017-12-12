# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bi,
  ecto_repos: [Bi.Repo]

# Configures the endpoint
config :bi, BiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r+lR3MJzXTd79Jd7GnTrLf6F42Druvk3BqBLDmoYSqMVk1brhq00L9AeJmvyJ14b",
  render_errors: [view: BiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
