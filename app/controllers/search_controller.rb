class SearchController < ApplicationController
  def index
    @results = ChargingStationResults.new(params['location'])
    @results.create_station
  end
end
