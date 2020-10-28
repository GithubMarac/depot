require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
end

test "prdoct is not valid without a unique title" do
    product = Product.new(title: products(:one).title,
                          description: "yyyyy",
                          price: 1,
                          image_url: "http://www.google.com/com.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
end

test "price should be positive" do
    product = Product.new(title: "book title",
                          description: "this is a description",
                          image_url: "http://image.com/image.gif")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    product.errors[:price]

    product.price = 1
    assert product.valid?

end

test "image url" do
    ok = %w{ test.jpg test.JPG https//url.com/test.gif }
    bad = %w{ www.google.com blabla text.txt dokument.doc }

    ok.each do |image_url|
        assert new_product(image_url).valid?, "#{image_url} should be valid"
    end

    bad.each do |image_url|
         assert new_product(image_url).invalid?, "#{image_url} should be invalid"
    end
end

def new_product(image_url)
Product.new(
                           title: "book title",
                           description: "this is a description",
                           image_url: image_url,
                           price: 1)
end


end