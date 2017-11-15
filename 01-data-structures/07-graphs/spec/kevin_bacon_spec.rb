
RSpec.describe Bacon do
  it "should test methods in Bacon.rb" do
    expect(Bacon.some_method).to eq "success"
  end

  it "should find kevin bacon in 3 movies" do

    anthony_hopkins = "anthony hopkins"

    expect(Bacon.find_kevin_bacon(anthony_hopkins)).to eq "Found link 3 degrees away"
  end
end
