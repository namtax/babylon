module PromotionalRules
  class TwoLavenderHearts
    THRESHOLD  = 2

    def self.run(items)
      items.map!(&method(:update_price)) if threshold_met?(items)
      items.map(&:price).inject(:+)
    end

    def self.threshold_met?(items)
      items.select{ |i| i.lavender_heart? }.size >= THRESHOLD
    end

    def self.update_price(item)
      item.lavender_heart? ? item.tap { |i| i.price = 8.50 } : item
    end
  end
end