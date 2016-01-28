module PromotionalRules
  class TwoLavenderHearts
    THRESHOLD = 2
    PRODUCT_NAME = 'Lavender Heart'

    def self.run(checkout)
      if threshold_met?(checkout.line_items)
        adjust_price(checkout.line_items)
      end
    end

    def self.threshold_met?(items)
      items[PRODUCT_NAME][:total] >= THRESHOLD
    end

    def self.adjust_price(items)
      items[PRODUCT_NAME][:price] = 8.50
    end
  end
end