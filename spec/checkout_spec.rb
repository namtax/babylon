describe Checkout do
  let(:item1) { Product.new(code: 001, name: 'Lavender Heart', price: 9.25) }
  let(:item2) { Product.new(code: 001, name: 'Personalised cufflinks', price: 45.00) }
  let(:item3) { Product.new(code: 001, name: 'Kids T-shirt', price: 19.95) }

  describe '#total' do
    it 'applies 10% off' do
      subject.scan(item1)
      subject.scan(item2)
      subject.scan(item3)
      expect(subject.total).to eq(66.78)
    end
  end
end