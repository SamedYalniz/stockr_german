class RemoveProductClassFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :product_class, :string
  end
end
