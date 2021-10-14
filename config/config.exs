# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :githubex,
  ecto_repos: [Githubex.Repo]

config :githubex, Githubex.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :githubex, GithubexWeb.Auth.Guardian,
  issuer: "githubex",
  secret_key: "CQrYk02+8K9a9V535WgcZLy0OcuHcZ4/TtHsFtUCMFMys2vRRe1c/BRIcikv55iP"

# Configures the endpoint
config :githubex, GithubexWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: GithubexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Githubex.PubSub,
  live_view: [signing_salt: "dOMt0iic"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
