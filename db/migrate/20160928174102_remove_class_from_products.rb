class RemoveClassFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :class, :string
  end
end
