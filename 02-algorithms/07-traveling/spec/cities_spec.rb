RSpec.describe Cities do
  describe "list" do

    it "mapping over it should return an array of city names" do

      expect(Cities.just_cities).to eq([
        "New York",
        "Los Angeles",
        "Chicago",
        "Houston",
        "Philadelphia",
        "Phoenix",
        "San Antonio",
        "San Diego",
        "Dallas",
        "San Jose",
        "Austin",
        "Indianapolis"
      ])
    end
  end
end
