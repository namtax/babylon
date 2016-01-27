class Checkout
  def initialize
    @items = []
  end

  def scan(item)
    items << item
  end

  def total
    sum = PromotionalRules::TwoLavenderHearts.run(items)
    PromotionalRules::TenPercentOff.run(sum)
  end

  private
  attr_reader :items
end