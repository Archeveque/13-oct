require_relative '../lib/Townhall'

describe "got email?" do
  describe "get townhall email" do
    it "should got email" do
      expect(townhall_email("ableiges",[],[])).to eq(["mairie.ableiges95@wanadoo.fr"])
    end
    it "should got email" do
      expect(townhall_email("domont",[],[])).to eq(["mairiedomont@magic.fr"])
    end
  end
  describe "get townhall email eevn if the array contains data" do
    it "should got email" do
      expect(townhall_email("ableiges",["ma ville"],["ableige"])).to eq(["ableige","mairie.ableiges95@wanadoo.fr"])
    end
    it "should got email" do
      expect(townhall_email("domont",["ma ville"],["domont"])).to eq(["domont","mairiedomont@magic.fr"])
    end
end
end

