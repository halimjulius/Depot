class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :pay_type_id, :ship_date
  #has_one :pay_type
  belongs_to :pay_type
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  validates :name, :address, :email, presence: true
  #validates :pay_type, :inclusion => PayType.names#PAYMENT_TYPES
  validates :pay_type_id, presence: true
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
