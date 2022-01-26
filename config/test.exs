import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :shortener, Shortener.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "shortener_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shortener, ShortenerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ki9PyaMoPcHjtIZ+f0GN0nmCknd0JjgzVot72FlzmkEDDYFEWb9xBGcE4VbAYCfp",
  server: true

config :shortener, :ecto_sandbox, Ecto.Adapters.SQL.Sandbox

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :wallaby,
  otp_app: :shortener,
  chromedriver: [headless: System.get_env("SHOW_BROWSER") != "true"]
