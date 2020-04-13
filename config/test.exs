use Mix.Config

# Configure your database
config :aws_warehouse, AwsWarehouse.Repo,
  username: "postgres",
  password: "postgres",
  database: "aws_warehouse_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :aws_warehouse, AwsWarehouseWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
