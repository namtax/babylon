class LineItem
  def initialize(input)
    @input = input.last
  end

  def total_price
    input[:price] * input[:total]
  end

  private
  attr_reader :input
end
