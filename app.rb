require_relative 'lib/product'
require_relative 'lib/cart'

class App
    def initialize(print_output = false)
        @cart = Cart.new
    end

    def input_name(product)
        puts "Product name:"
        name = gets.chomp

        if name.empty?
            puts "Name cannot be empty."
            return input_name(product)
        end

        product.name = name
    end

    def input_amount(product)
        puts "Product amount:"
        amount = gets.chomp

        if !amount.match?(/^\d+$/) || amount.to_i <= 0
            puts "Amount must be a positive number"
            return input_amount(product)
        end

        product.amount = amount.to_i
    end

    def input_tax_type(product)
        puts "If product is book/food/medical type 'y'. Else type 'n'."

        resp = gets.chomp.downcase

        if resp != "y" && resp != "n"
            return input_tax_type(product)
        end

        product.tax_free = resp == "y"
    end

    def input_price(product)
        puts "Product price:"
        price = gets.chomp

        if !price.match?(/^\d+(\.\d+)?$/) || price.to_f <= 0
            puts "Price must be a number above 0."
            return input_price(product)
        end

        product.price = price.to_f
    end

    def input_imported(product)
        puts "Product imported: (y/n)"
        resp = gets.chomp.downcase

        if resp != "y" && resp != "n"
            return input_imported(product)
        end

        product.imported = resp == "y"
    end

    def input_product
        p = Product.new

        input_name(p)
        input_amount(p)
        input_price(p)
        input_tax_type(p)
        input_imported(p)

        return p
    end

    def add_product
        p = input_product

        @cart.add_product(p)
 
        puts "Add another product? (y/n)"
        resp = gets.chomp.downcase

    end

    def start
        resp = "y"
        
        while resp == "y"
            p = input_product
            @cart.add_product(p)

            puts "Add another product? (y/n)"

            resp = gets.chomp.downcase

            if resp != "y" && resp != "n"
                resp = "y"
                puts "Invalid response."
            end
        end

        puts "-----RECEIPT-----"

        @cart.calculate_total

        @cart.product_list.each do |product|
            puts "#{product.amount} #{'imported' if product.imported} #{product.name} at #{'%.2f' % product.total_price_with_tax}"
        end

        puts "Sales Taxes: #{'%.2f' % @cart.sales_tax}"
        puts "Total: #{'%.2f' % @cart.total}"
    end
end

a = App.new
a.start