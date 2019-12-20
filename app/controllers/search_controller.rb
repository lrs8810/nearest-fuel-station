class SearchController < ApplicationController
  def index
    @results = ChargingStationResults.new(params['location'])
    @results.get_station
    binding.pry
  end
end
