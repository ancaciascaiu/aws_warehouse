defmodule AwsWarehouse.ReleaseTasks do
  def migrate() do
    IO.puts("***** RUNNING MIGRATIONS *****")
    {:ok, _} = Application.ensure_all_started(:aws_warehouse)

    path = Application.app_dir(:aws_warehouse, "priv/repo/migrations")

    Ecto.Migrator.run(AwsWarehouse.Repo, path, :up, all: true)
    IO.puts("***** FINISHED MIGRATIONS *****")
  end
end
