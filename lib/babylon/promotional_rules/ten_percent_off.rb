module Babylon
  module PromotionalRules
    class TenPercentOff
      THRESHOLD = 60
      DISCOUNT  = 0.10

      def self.run(checkout)
        if checkout.sum > THRESHOLD
          checkout.discount = DISCOUNT
        end
      end
    end
  end
end