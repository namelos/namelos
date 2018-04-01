# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :namelos,
  ecto_repos: [Namelos.Repo]

# Configures the endpoint
config :namelos, NamelosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kqeNHrDq4+Hhyb+8uj1T748Ym5Y78ZnrL2sxW6wLhoosQm6dKtSXBZQ6QcA8lH5y",
  render_errors: [view: NamelosWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Namelos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
