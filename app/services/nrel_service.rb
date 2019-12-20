class NrelService
  def initialize(location)
    @location = location
  end

  def connection
    Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
      faraday.params['api_key'] = ENV['NREL_API_KEY']
      faraday.params['fuel_type'] = 'ELEC'
      faraday.params['location'] = @location
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = connection.get
    JSON.parse(response.body)['fuel_stations'].first
  end
end
