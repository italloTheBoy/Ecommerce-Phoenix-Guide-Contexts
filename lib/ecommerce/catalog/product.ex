defmodule Ecommerce.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :title, :string
    field :price, :decimal
    field :views, :integer, default: 0
    field :description, :string

    many_to_many :categories, Category, join_through: "products_categories", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price, :views, :description])
    |> validate_required([:title, :price])
  end
end
