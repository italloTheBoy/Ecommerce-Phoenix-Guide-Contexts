defmodule EcommerceWeb.ProductView do
  use EcommerceWeb, :view
  alias Ecommerce.Catalog

  def category_select(f, changeset) do
    existing_ids = 
      changeset
      |> Ecto.Changeset.get_change(:categories, [])
      |> Enum.map(& &1.data.id)

    category_opts =
      for category <- Catalog.list_categories() do
        [
          key: category.title, 
          value: category.id, 
          selected: category.id in existing_ids
        ]
      end

    multiple_select(f, :category_ids ,category_opts)

  end
end
