require 'account'

describe Account do
  let(:subject) { described_class.new("Jane Doe") }

  describe '#initialize' do
    it "requires an owner" do
      expect(subject.owner).to eq "Jane Doe"
    end
    it "has a default balance of 0" do
      expect(subject.balance).to eq 0
    end
    it "can be initialized with a custom balance" do
      account = Account.new("Jane Doe",4000)
      expect(account.balance).to eq 4000
    end
    it "has an empty array of withdrawals" do
      expect(subject.withdrawals).to eq []
    end
    it "has an empty array of deposits" do
      expect(subject.deposits).to eq []
    end
  end
end
