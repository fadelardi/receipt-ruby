require_relative '../lib/product'
require_relative '../lib/cart'

RSpec.describe Product do
  context "tax calculation" do
    it "verifies example 1" do
        product = Product.new("book", 2, 12.49, true, false)
        product2 = Product.new("music CD", 1, 14.99, false, false)
        product3 = Product.new("chocolate bar", 1, 0.85, true, false)

        cart = Cart.new
        cart.add_product(product)
        cart.add_product(product2)
        cart.add_product(product3)
        cart.calculate_total

        expect(cart.total).to eq(42.32)
        expect(cart.sales_tax).to eq(1.50)
    end

    it "verifies example 2" do
        product = Product.new("box of chocolates", 1, 10.00, true, true)
        product2 = Product.new("bottle of perfume", 1, 47.50, false, true)

        cart1 = Cart.new
        cart1.add_product(product)
        cart1.add_product(product2)
        cart1.calculate_total

        expect(cart1.sales_tax).to eq(7.65)
        expect(cart1.total).to eq(65.15)
    end

    it "verifies example 3" do
        product = Product.new("bottle of perfume", 1, 27.99, false, true)
        product2 = Product.new("bottle of perfume", 1, 18.99, false, false)
        product3 = Product.new("headache pills", 1, 9.75, true, false)
        product4 = Product.new("box of chocolates", 3, 11.25, true, true)

        cart2 = Cart.new
        cart2.add_product(product)
        cart2.add_product(product2)
        cart2.add_product(product3)
        cart2.add_product(product4)
        cart2.calculate_total

        expect(cart2.sales_tax).to eq(7.90)
        expect(cart2.total).to eq(98.38)
    end
  end
end