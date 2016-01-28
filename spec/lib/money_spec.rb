describe Money do
  describe '#pounds' do
    subject      { described_class.new(amount) }
    let(:amount) { 50.00111 }

    it { expect(subject.to_pounds).to eq '£50.00' }
  end
end