class Product
  attr_accessor :code, :name, :price

  LAVENDER_HEART_CODE = 001

  def initialize(input)
    @code  = input[:code]
    @name  = input[:name]
    @price = input[:price]
  end

  def lavender_heart?
    code == LAVENDER_HEART_CODE
  end
end