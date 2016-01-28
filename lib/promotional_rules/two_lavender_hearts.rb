module PromotionalRules
  class TwoLavenderHearts
    THRESHOLD = 2
    PRODUCT_NAME = 'Lavender Heart'
    DISOUNT = 8.50

    def self.run(checkout)
      if threshold_met?(checkout)
        adjust_price(checkout)
      end
    end

    def self.threshold_met?(checkout)
      checkout.fetch_item_quantity(PRODUCT_NAME) >= THRESHOLD
    end

    def self.adjust_price(checkout)
      checkout.adjust_item_price(PRODUCT_NAME, DISOUNT)
    end
  end
end