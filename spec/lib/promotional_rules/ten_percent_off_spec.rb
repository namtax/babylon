module PromotionalRules
  describe TenPercentOff do
    subject { described_class }

    describe '#run' do
      context 'amount above £60' do
        let(:amount) { 74.20 }
        it 'takes 10% off total' do
          expect(subject.run(amount)).to eq(66.78)
        end
      end

      context 'amount below £60' do
        let(:amount) { 59.99 }
        it 'does nothing' do
          expect(subject.run(amount)).to eq(59.99)
        end
      end
    end
  end
end