defmodule Ecommerce.ShoppingCart.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecommerce.ShoppingCart.Cart
  alias Ecommerce.Catalog.Product

  schema "cart_items" do
    field :price_when_carted, :decimal
    field :quantity, :integer

    belongs_to :cart, Cart
    belongs_to :product, Product 

    timestamps()
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:price_when_carted, :quantity])
    |> validate_required([:price_when_carted, :quantity])
    |> validate_number(:quantity, greater_than: -1, less_than: 101)
  end
end
