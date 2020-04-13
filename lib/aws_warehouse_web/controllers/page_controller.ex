defmodule AwsWarehouseWeb.PageController do
  use AwsWarehouseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
