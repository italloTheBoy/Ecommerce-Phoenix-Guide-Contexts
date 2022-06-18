defmodule EcommerceWeb.CartController do
  use EcommerceWeb, :controller
  alias Ecommerce.ShoppingCart

  def show(conn, _params) do
    render(conn, "show.html", changeset: ShoppingCart.change_cart(conn.assigns.cart))
  end

  def update(conn, %{"cart" => cart_params}) do
    case ShoppingCart.update_cart(conn.assigns.cart, cart_params) do
      {:ok, _cart} -> 
        redirect(conn, to: Routes.cart_path(conn, :show))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Cart could not be updated")
        |> redirect(to: Routes.cart_path(conn, :show))
    end
  end 
end
