class LineItem
  attr_accessor :price, :quantity

  def initialize(input)
    @price    = input.first.price
    @quantity = input.last
  end

  def total_price
    price * quantity
  end
end
