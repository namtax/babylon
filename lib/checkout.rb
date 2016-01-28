  class Checkout
  attr_accessor :discount, :totals

  def initialize(promotional_rules = [])
    @rules    = promotional_rules
    @totals   = Hash.new 0
    @discount = 0
  end

  def scan(item)
    totals[item] += 1
  end

  def total
    rules.each { |r| r.run(self) }
    Money.new(discount_sum).to_pounds
  end

  def sum
    line_items.values
      .map{ |i| i.total_price }
      .inject(:+)
  end

  def line_items
    @line_items ||= build_line_items
  end

  def fetch_item_quantity(product)
    line_items[product].quantity
  end

  def adjust_item_price(product, price)
    line_items[product].price = price
  end

  private
  attr_accessor :rules

  def build_line_items
    totals.reduce({}) do |hash, i|
      hash[i.first.name] = LineItem.new(i)
      hash
    end
  end

  def discount_sum
    sum * (1 - discount)
  end
end