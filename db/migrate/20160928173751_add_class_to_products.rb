class AddClassToProducts < ActiveRecord::Migration
  def change
    add_column :products, :class, :string
  end
end
