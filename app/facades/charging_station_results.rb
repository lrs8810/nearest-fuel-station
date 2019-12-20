class ChargingStationResults
  attr_reader :station

  def initialize(location)
    @nrel_service = NrelService.new(location)
    get_station_data
    @station = Station.new(get_station_data)
  end

  def get_station_data
    station_data = @nrel_service.get_json
    {
      name: station_data['station_name'],
      address: "#{station_data['street_address']}, #{station_data['city']}, #{station_data['state']} #{station_data['zip']}",
      fuel_type: station_data['fuel_type_code'],
      access_times: station_data['access_days_time']
    }
  end
end
