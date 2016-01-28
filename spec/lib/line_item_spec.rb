describe LineItem do
  describe '#total_price' do
    subject     { described_class.new(input) }
    let(:input) { ["Lavender Heart", {:price=>10, :total=>4}] }

    it { expect(subject.total_price).to eq 40 }
  end
end