defmodule Ecommerce.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string,  null: false, size: 50
      add :price, :decimal, null: false, precision: 15, scale: 6
      add :views, :integer, null: false, default: 0
      add :description, :string

      timestamps()
    end
  end
end
