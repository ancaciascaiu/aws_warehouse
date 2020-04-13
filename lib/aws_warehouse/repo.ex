defmodule AwsWarehouse.Repo do
  use Ecto.Repo,
    otp_app: :aws_warehouse,
    adapter: Ecto.Adapters.Postgres
end
