require_relative '../lib/Trading'

describe "got crypto name?" do
    it "should return first on the list" do
      expect(test_crypto_data).to eq("Bitcoin")
    end
end

describe "hash is working" do
    it "should return the name and the value" do
      expect(test_crypto_infos("Bitcoin","$3.50").to eq(["Bitcoin","3.50")]
    end
end

