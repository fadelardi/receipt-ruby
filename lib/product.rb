class Product
    attr_accessor :name, :price, :amount, :tax_free, :tax, :imported

    def initialize(name = "product", amount = 1, price = 0.01, tax_free = false, imported = false)
        @name = name
        @price = price
        @amount = amount
        @tax_free = tax_free
        @imported = imported
        @tax = 0.0
    end

    def total_price
        (@price * @amount).round(2)
    end

    def total_price_with_tax
        ((@price + @tax) * @amount).round(2)
    end

    def round_to_nearest_0_05(amount)
        round_threshold = 100.0 / 5.0
        decimal_remainder = (amount * round_threshold) % 1
        if decimal_remainder == 0
          return amount
        else
          return ((amount * round_threshold).ceil) / round_threshold
        end
      end
      

    def calculate_tax
        tax_rate = 0.0
        tax_rate = 0.1 unless @tax_free
        tax_rate += 0.05 if @imported

        tax_amount = (@price * tax_rate).round(2)
        @tax = round_to_nearest_0_05(tax_amount)
    end
end
  