module PromotionalRules
  describe TwoLavenderHearts do
    subject { described_class }

    describe '.run' do
      let(:item1) { Product.new(code: 001, name: 'Lavender Heart', price: 9.25) }
      let(:item2) { Product.new(code: 002, name: 'Personalised cufflinks', price: 45.00) }
      let(:item3) { Product.new(code: 003, name: 'Kids T-shirt', price: 19.95) }

      context 'two lavender hearts' do
        it 'reduces price to 8.50' do
          expect(subject.run([item1, item1])).to eq 17
        end
      end

      context 'three lavender hearts' do
        it 'reduces price to 8.50' do
          expect(subject.run([item1, item1, item1])).to eq 25.50
        end
      end

      context 'one lavender heart' do
        it 'does not touch price' do
          expect(subject.run([item1])).to eq 9.25
        end
      end

      context 'multiple items' do
        it 'only effects price of lavender hearts' do
          expect(subject.run([item1, item1, item3])).to eq 36.95
        end
      end
    end
  end
end