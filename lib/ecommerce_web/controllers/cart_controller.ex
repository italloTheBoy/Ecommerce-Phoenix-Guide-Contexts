defmodule EcommerceWeb.CartController do
  use EcommerceWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
