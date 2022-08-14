# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :tech_challenge_tradesquash,
  ecto_repos: [TechChallengeTradesquash.Repo]

# Configures the endpoint
config :tech_challenge_tradesquash, TechChallengeTradesquashWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: TechChallengeTradesquashWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: TechChallengeTradesquash.PubSub,
  live_view: [signing_salt: "F+x3+zVT"]

config :tailwind,
  version: "3.1.8",
  default: [
    args: ~w(
    --config=tailwind.config.js
    --input=css/app.css
    --output=../priv/static/assets/app.css
  ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :tech_challenge_tradesquash, TechChallengeTradesquash.Mailer,
  adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
# config :esbuild,
#   version: "0.14.0",
#   default: [
#     args:
#       ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
#     cd: Path.expand("../assets", __DIR__),
#     env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
#   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tech_challenge_tradesquash, TechChallengeTradesquashWeb.Auth.Guardian,
  issuer: "tech_challenge_tradesquash",
  secret_key: "RzFwNTKptdQARQWA/Hgc57tN3ncZ6tlK985Zr3uMg8oTHRqjqFfxjuvq7G9to1DZ"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
