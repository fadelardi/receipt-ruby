require_relative '../lib/product'

RSpec.describe Product do
  context "tax calculation" do
    it "applies standard 10%" do
      product = Product.new("test", 1, 100, false, false)
      product.calculate_tax

      expect(product.tax).to eq(10)
    end

    it "do not tax when protected category" do
      product = Product.new("protected category", 1, 100, true, false)
      product.calculate_tax

      expect(product.tax).to eq(0.0)
    end

    fit "taxes imported products", :focus => true do
      product = Product.new("imported whatever", 1, 100, false, true)
      product.calculate_tax

      expect(product.tax).to eq(15.0)
    end

    it "applies both taxes" do
      product = Product.new("imported food", 1, 100, true, true)
      product.calculate_tax

      expect(product.tax).to eq(5.0)
    end
  end
end