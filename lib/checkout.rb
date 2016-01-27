class Checkout
  def initialize
    @items = []
  end

  def scan(item)
    items << item
  end

  def total
    PromotionalRules::TenPercentOff.run(sum)
  end

  private
  attr_reader :items

  def sum
    items.map(&:price).inject(:+)
  end
end