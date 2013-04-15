require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "product is not valid without a unique title" do
  product = Product.new(title: products(:ruby).title,
  description: "yyy",
  price: 1,
  image_url: "fred.gif")
assert !product.save
assert_equal "has already been taken", product.errors[:title].join('; ')
end

  def new_product_with_url(image_url)
    Product.new(
      title: "My Book Title",
      description: "yyy",
      price: 1,
      image_url: image_url
    )
  end

  test "product is not valid without a unique image_url" do
    product = new_product_with_url(products(:ruby).image_url)
    assert !product.save
    assert_equal "has already been taken", product.errors[:image_url].join('; ')
  end
end
