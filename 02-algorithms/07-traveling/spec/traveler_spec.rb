RSpec.describe Traveler do
  describe "#neartest_possible_neighbor"do
    it "return array of cities in order that he should travel" do

      traveling_salesman = Traveler.new
      sorted_array_of_hashes = traveling_salesman.neartest_possible_neighbor(four_random_cities, "New York")
      sorted_array_of_city_strings = sorted_array_of_hashes.map do |hash|
        hash[:city]
      end

      expect(sorted_array_of_city_strings).to eq ["New York", "Philadelphia", "Dallas", "Los Angeles"]
    end
  end
end

def four_random_cities
  [
    {
        city: "New York",
        x: 40.7127,
        y: -74.0059,
    },
    {
        city: "Los Angeles",
        x: 34.0522,
        y: -118.2436,
    },
    {
        city: "Philadelphia",
        x: 39.9525,
        y: -75.1652,
    },
    {
        city: "Dallas",
        x: 32.7766,
        y: -96.7969,
    }
  ]
end
