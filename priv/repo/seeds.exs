# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ecommerce.Repo.insert!(%Ecommerce.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

id = 2

res 
  id
  |> Catalog.get_product!()
  |> Catalog.inc_product_views()
