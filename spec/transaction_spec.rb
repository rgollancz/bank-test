require 'transaction'

describe Transaction do
  let(:subject) { described_class.new("18/12/2016",500,4500) }

  describe "#initialize" do
    it "has a date" do
      expect(subject.date).to eq "18/12/2016"
    end
    it "has an amount" do
      expect(subject.amount).to eq 500
    end
    it "has a balance" do
      expect(subject.balance).to eq 4500
    end
  end
end
