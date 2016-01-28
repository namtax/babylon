module Babylon
  describe LineItem do
    describe '#total_price' do
      subject       { described_class.new(input) }
      let(:input)   { [product, 4] }
      let(:product) { Product.create(code: 001, name: 'Lavender Heart', price: 10) }

      it { expect(subject.total_price).to eq 40 }
    end
  end
end