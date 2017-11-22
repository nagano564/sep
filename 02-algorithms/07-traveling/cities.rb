class Cities

  def self.list
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
          city: "Chicago",
          x: 41.8781,
          y: -87.6297,
      },
      {
          city: "Houston",
          x: 29.7604,
          y: -95.3698,
      },
      {
          city: "Philadelphia",
          x: 39.9525,
          y: -75.1652,
      },
      {
          city: "Phoenix",
          x: 33.4483,
          y: -112.0740,
      },
      {
          city: "San Antonio",
          x: 29.4241,
          y: -98.4936,
      },
      {
          city: "San Diego",
          x: 32.7157,
          y: -117.1610,
      },
      {
          city: "Dallas",
          x: 32.7766,
          y: -96.7969,
      },
      {
          city: "San Jose",
          x: 37.3382,
          y: -121.8863,
      },
      {
          city: "Austin",
          x: 30.2671,
          y: -97.7430,

      },
      {
          city: "Indianapolis",
          x: 39.7684,
          y: -86.1580,
      },
    ]
  end

  def self.just_cities
    Cities.list.map do |a_hash|
      a_hash[:city]
    end
  end
end
