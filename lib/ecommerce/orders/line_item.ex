defmodule Ecommerce.Orders.LineItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecommerce.Catalog.Product
  alias Ecommerce.Orders.Order

  schema "order_line_items" do
    field :price, :decimal
    field :quantity, :integer

    belongs_to :order, Order
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:price, :quantity])
    |> validate_required([:price, :quantity])
  end
end
