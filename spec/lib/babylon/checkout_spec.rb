module Babylon
  describe Checkout do
    subject     { described_class.new(rules) }
    let(:rules) { [PromotionalRules::TwoLavenderHearts, PromotionalRules::TenPercentOff] }
    let(:item1) { Product.create(code: '001', name: 'Lavender Heart', price: 9.25) }
    let(:item2) { Product.create(code: '002', name: 'Personalised cufflinks', price: 45.00) }
    let(:item3) { Product.create(code: '003', name: 'Kids T-shirt', price: 19.95) }

    before      { basket.each { |b| subject.scan(b) } }

    describe '#total' do
      context 'total above £60' do
        let(:basket) { [item1, item2, item3] }
        it 'applies 10% off' do
          expect(subject.total).to eq("£66.78")
        end
      end

      context 'two lavender hearts' do
        let(:basket) { [item1, item3, item1] }
        it 'applies discount to lavender hearts' do
          expect(subject.total).to eq("£36.95")
        end
      end

      context 'two lavender hearts and over £60' do
        let(:basket) { [item1, item2, item1, item3] }
        it 'applies both discounts' do
          expect(subject.total).to eq("£73.76")
        end
      end

      context 'no rules' do
        let(:rules)  { [] }
        let(:basket) { [item1, item2, item3] }
        it 'does nothing' do
          expect(subject.total).to eq("£74.20")
        end
      end
    end
  end
end