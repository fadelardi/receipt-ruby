class Cart
    attr_accessor :total, :sales_tax, :product_list

    def initialize
        @total = 0
        @sales_tax = 0
        @product_list = []
    end

    def add_product(product)
        @product_list.push(product)
    end

    def calculate_total
        @total = 0
        @sales_tax = 0

        @product_list.each do |product|
            product.calculate_tax
            @sales_tax += product.tax * product.amount
            @total += product.total_price_with_tax
        end

        @sales_tax = @sales_tax.round(2)
        @total = @total.round(2)
    end
end

  