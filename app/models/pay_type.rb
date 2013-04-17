class PayType < ActiveRecord::Base
  attr_accessible :name
  #belongs_to :order
  has_many :order
  delegate :name, :to => :tag, :prefix => true
  def self.names
    all.collect { |pay_type| pay_type.name }
  end
  def self.getName(pay_type_id)
    pay_type_item = PayType.find("1")
    puts pay_type_item.name
  end
end
