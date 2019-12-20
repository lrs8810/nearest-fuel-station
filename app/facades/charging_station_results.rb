class ChargingStationResults
  def initialize(location)
    @nrel_service = NrelService.new(location)
  end

  def get_station
    station_data = @nrel_service.get_json
    station_hash = {
      name: station_data['station_name'],
      address: "#{station_data['street_address']}, #{station_data['city']}, #{station_data['state']} #{station_data['zip']}",
      fuel_type: station_data['fuel_type_code'],
      access_times: station_data['access_days_time']
    }
    binding.pry
    Station.new(station_hash)
  end

end
