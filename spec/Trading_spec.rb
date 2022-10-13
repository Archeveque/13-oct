require_relative '../lib/Trading'

describe "got crypto name?" do
    it "should return first on the list" do
      expect(test_crypto_data).to eq("Bitcoin")
    end
end


