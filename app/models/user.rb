class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_attached_file :image, styles: { small: "64x64", medium: "200x200", large: "200x200" }
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def stock_update
    CustomerMailer.stock_update(self).deliver_now
  end
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one :stock
end
