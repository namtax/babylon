class Product
  attr_reader :code, :name, :price

  def initialize(input)
    @code  = input[:code]
    @name  = input[:name]
    @price = input[:price]
  end
end