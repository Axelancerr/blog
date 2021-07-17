defmodule BlogWeb.IndexController do
  use BlogWeb, :controller

  def show(conn, _params) do
    render(conn, "index.html")
  end

end
