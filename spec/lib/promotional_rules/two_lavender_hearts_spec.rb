module PromotionalRules
  describe TwoLavenderHearts do
    subject { described_class }

    describe '.run' do
      let(:item1)    { Product.new(code: 001, name: 'Lavender Heart', price: 9.25) }
      let(:item2)    { Product.new(code: 002, name: 'Personalised cufflinks', price: 45.00) }
      let(:item3)    { Product.new(code: 003, name: 'Kids T-shirt', price: 19.95) }
      let(:checkout) { Checkout.new }

      before         { basket.each { |b| checkout.scan(b) } }

      context 'two lavender hearts' do
        let(:basket) { [item1, item1] }

        it 'reduces price to 8.50' do
          subject.run(checkout)
          expect(checkout.total).to eq "£17.00"
        end
      end

      context 'three lavender hearts' do
        let(:basket) { [item1, item1, item1] }

        it 'reduces price to 8.50' do
          subject.run(checkout)
          expect(checkout.total).to eq "£25.50"
        end
      end

      context 'one lavender heart' do
        let(:basket) { [item1] }

        it 'does not touch price' do
          subject.run(checkout)
          expect(checkout.total).to eq "£9.25"
        end
      end

      context 'multiple items' do
        let(:basket) { [item1, item1, item3] }

        it 'only effects price of lavender hearts' do
          subject.run(checkout)
          expect(checkout.total).to eq "£36.95"
        end
      end
    end
  end
end