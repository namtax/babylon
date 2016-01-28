class Money
  def initialize(amount)
    @amount = amount
  end

  def to_pounds
    "£%.2f" % amount
  end

  private
  attr_reader :amount
end
