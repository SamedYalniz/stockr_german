class Product < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def all_attributes
    "#{name} | Herkunftsland: #{country_of_origin} | Paketgröße: #{boxsize} | Paketpreis: #{boxprice} | Produktklasse: #{product_class}"
  end
end
