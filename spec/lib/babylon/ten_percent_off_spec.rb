module Babylon
  module PromotionalRules
    describe TenPercentOff do
      subject        { described_class }
      let(:checkout) { Checkout.new }
      let(:item)     { Product.create(code: '010', name: 'Bag', price: price) }

      describe '#run' do
        before { checkout.scan(item) }

        context 'amount above £60' do
          let(:price) { 74.20 }

          it 'takes 10% off total' do
            subject.run(checkout)
            expect(checkout.total).to eq("£66.78")
          end
        end

        context 'amount below £60' do
          let(:price) { 59.99 }

          it 'does nothing' do
            subject.run(checkout)
            expect(checkout.total).to eq("£59.99")
          end
        end
      end
    end
  end
end