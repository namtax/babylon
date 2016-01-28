module Babylon
  class Product
    attr_accessor :code, :name, :price

    LAVENDER_HEART_CODE = 001

    def self.create(input)
      new(input)
    end

    def initialize(input)
      @code  = input[:code]
      @name  = input[:name]
      @price = input[:price]
    end
  end
end