defmodule Ecommerce.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecommerce.Orders.LineItem

  schema "orders" do
    field :user_uuid, Ecto.UUID
    field :total_price, :decimal

    has_many :line_items, LineItem
    has_many :products, through: [:line_items, :product]

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:user_uuid, :total_price])
    |> validate_required([:user_uuid, :total_price])
  end
end
