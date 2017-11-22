RSpec.describe Distance do
  describe "#how_far"do
    it "should calculate distance from lat and long coordinates" do
  
      distance_of_two_cities = Distance.new(20,25,10,9)

      expect(distance_of_two_cities.how_far).to eq 18.867962264113206
    end
  end

end
