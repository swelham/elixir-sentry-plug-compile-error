# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sentry_plug_error,
  ecto_repos: [SentryPlugError.Repo]

# Configures the endpoint
config :sentry_plug_error, SentryPlugErrorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mAJ29UqaCMHq6d/t+Wlov7koywqZv1Cce4kG4flQsrEduv0XCZ90PA/sqv5CRFBz",
  render_errors: [view: SentryPlugErrorWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SentryPlugError.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :sentry,
  dsn: System.get_env("SENTRY_DSN"),
  environment_name: Mix.env(),
  enable_source_code_context: true,
  root_source_code_path: File.cwd!(),
  tags: %{
    env: "production"
  },
  included_environments: [:prod]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
