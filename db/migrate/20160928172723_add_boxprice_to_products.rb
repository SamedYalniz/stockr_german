class AddBoxpriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :boxprice, :string
  end
end
