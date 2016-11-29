require 'statement'
require 'time'

describe Statement do
  let(:dummy_class) { Class.new { include Statement } }

  describe "#format_amount" do
    it "formats a positive transaction amount" do
      expect(dummy_class.new.format_amount(456)).to eq "  456.00"
    end
    it "formats a negative transaction amount" do
      expect(dummy_class.new.format_amount(-456)).to eq "            456.00"
    end
  end

end
