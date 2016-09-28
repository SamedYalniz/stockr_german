class AddProductClassToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_class, :integer
  end
end
