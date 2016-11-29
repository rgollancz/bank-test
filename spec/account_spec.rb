require 'account'

describe Account do
  let(:subject) { described_class.new("Jane Doe") }
  let(:subject_1) { described_class.new("Jane Doe",4000) }

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
    it "has an empty array of transactions" do
      expect(subject.transactions).to eq []
    end
  end

  describe '#withdraw' do
    it "reduces the account balance by the amount withdrawn" do
      expect { subject_1.withdraw("18/12/2016",200) }.to change{subject_1.balance}.by(-200)
    end
    it "increases the transaction count" do
      expect { subject_1.withdraw("18/12/2016",200) }.to change{subject_1.transactions.length}.by(1)
    end
  end

  describe '#deposit' do
    it "increases the account balance by the amount withdrawn" do
      expect { subject_1.deposit("18/12/2016",100) }.to change{subject_1.balance}.by(100)
    end
    it "increases the transaction count" do
      expect { subject_1.deposit("18/12/2016",200) }.to change{subject_1.transactions.length}.by(1)
    end
  end

  # describe '#print_statement' do
  #   it "formats the transaction passed to it" do
  #     transaction =
  #     expect
  #   end
  # end
end
