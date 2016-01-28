class Product
  attr_accessor :code, :name, :price

  LAVENDER_HEART_CODE = 001

  def self.create(input)
    object = new(input)
    all << object
    object
  end

  def self.all
    @all ||= []
  end

  def self.where(opts)
    property, value = *opts.first
    all.detect{ |a| a.code == LAVENDER_HEART_CODE }
  end

  def initialize(input)
    @code  = input[:code]
    @name  = input[:name]
    @price = input[:price]
  end

  def lavender_heart?
    code == LAVENDER_HEART_CODE
  end
end