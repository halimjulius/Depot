require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "product is not valid without a unique title - i18n" do
  product = Product.new(title: products(:ruby).title,
  description: "yyy",
  price: 1,
  image_url: "fred.gif")
  assert_equal I18n.translate('activerecord.errors.messages.taken'),
    product.errors[:title].join('; ')
end
end
