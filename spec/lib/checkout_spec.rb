describe Checkout do
  let(:item1) { Product.new(code: 001, name: 'Lavender Heart', price: 9.25) }
  let(:item2) { Product.new(code: 002, name: 'Personalised cufflinks', price: 45.00) }
  let(:item3) { Product.new(code: 003, name: 'Kids T-shirt', price: 19.95) }

  describe '#total' do
    it 'applies 10% off' do
      subject.scan(item1)
      subject.scan(item2)
      subject.scan(item3)
      expect(subject.total).to eq(66.78)
    end

    context 'two lavender hearts' do
      it 'applies discount to lavender hearts' do
        subject.scan(item1)
        subject.scan(item3)
        subject.scan(item1)
        expect(subject.total).to eq(36.95)
      end
    end
  end
end