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
    (sum * (1 - discount)).round(2)
  end

  def line_items
    @line_items ||= build_line_items
  end

  def sum
    line_items.values.map{ |i| i[:price] * i[:total] }.inject(:+)
  end

  private
  attr_accessor :rules

  def build_line_items
    totals.reduce({}) do |hash, i|
      hash[i.first.name] = { price: i.first.price, total: i.last }
      hash
    end
  end
end