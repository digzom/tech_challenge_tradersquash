import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :tech_challenge_tradesquash, TechChallengeTradesquash.Repo,
  username: "challenge_admin",
  password: "challenge",
  hostname: "localhost",
  database: "tech_challenge_tradesquash_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tech_challenge_tradesquash, TechChallengeTradesquashWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "HqHj5q8kYTuOg79kplrZFuuY1Ys7QMtCqcY0exq8/SpwTd+HY8VEMv7xlIcRpcjO",
  server: true

config :tech_challenge_tradesquash, :sql_sandbox, true


# In test we don't send emails.
config :tech_challenge_tradesquash, TechChallengeTradesquash.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
