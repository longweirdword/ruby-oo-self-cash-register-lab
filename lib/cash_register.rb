require "pry"
class CashRegister
attr_accessor :total, :discount, :last_item 

    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
    end 

    def add_item(item, price, quantity = 1)
        self.total += price * quantity 
        quantity.times{@items << item} 
        @last_item = price * quantity 
    end 

    def apply_discount
        if @discount > 0
        self.total = @total - @total * @discount / 100.00
        self.total = @total.to_i if @total == @total.to_i 
        "After the discount, the total comes to $#{@total}."
        else 
        "There is no discount to apply."
        end 
    end 

    def items
        @items 
    end 

    def void_last_transaction 
        @total -= @last_item 
        @items.pop 
    end 

end 
