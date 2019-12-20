class SearchController < ApplicationController
  def index
    connection = Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
      faraday.params['api_key'] = ENV['NREL_API_KEY']
      faraday.params['fuel_type'] = 'ELEC'
      faraday.params['location'] = '1331 17th St LL100, Denver, CO 80202'
      faraday.adapter Faraday.default_adapter
    end
    response = connection.get
    binding.pry

    raw_data = JSON.parse(response.body)['fuel_stations'].first
    binding.pry
  end
end
