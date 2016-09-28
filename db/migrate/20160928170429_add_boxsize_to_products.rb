class AddBoxsizeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :boxsize, :string
  end
end
