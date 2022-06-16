defmodule EcommerceWeb.CartItemController do
  use EcommerceWeb, :controller
  alias Ecommerce.{ShoppingCart, Catalog}

  def create(conn, %{"product_id" => product_id}) do 
    product = Catalog.get_product!(product_id)
    
    case ShoppingCart.add_item_to_cart(conn.assigns.cart, product) do
      {:ok, _item} -> 
        conn
        |> put_flash(:info, "Item add to your cart")
        |> redirect(to: Routes.cart_path(conn, :show))
          
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Item could not be added to your cart")
        |> redirect(to: Routes.cart_path(conn, :show))
    end  
  end

  def delete(conn, %{"id" => product_id}) do
    case ShoppingCart.remove_item_from_cart(conn.assigns.cart, product_id) do
      {:ok, _cart} ->
        conn
        |> put_flash(:info, "Item removed from your cart")
        |> redirect(to: Routes.cart_path(conn, :show)) 

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Invalid item")
        |> redirect(to: Routes.cart_path(conn, :show))
    end 
  end
end