class Station
  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(station_details)
    @name = station_details[:name]
    @address = station_details[:address]
    @fuel_type = station_details[:fuel_type]
    @access_times = station_details[:access_times]
  end
end
