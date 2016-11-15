class Product < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :country_of_origin
  validates_presence_of :boxsize
  validates_presence_of :boxprice
  validates_presence_of :product_class




  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def all_attributes
    "#{name} | Herkunftsland: #{country_of_origin} | Paketgröße: #{boxsize} | Paketpreis: #{boxprice} | Produktklasse: #{product_class}"
  end
end
