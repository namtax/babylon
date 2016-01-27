module PromotionalRules
  class TenPercentOff
    THRESHOLD = 60
    DISCOUNT  = 0.10

    def self.run(amount)
      if amount > THRESHOLD
        amount - (amount * DISCOUNT)
      else
        amount
      end
    end
  end
end