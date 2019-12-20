# We will be using:
# The NREL alternate fuel stations nearest station API: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/
# The Google Directions API: https://developers.google.com/maps/documentation/directions/start
# We will be searching for the nearest electric charging station to Turing.
# As a user
# When I visit "/"
# And I select "Turing" from the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1min)
# - The HTML direction instructions to get to that fuel station
#   "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"

require 'rails_helper'

describe "user can visit the search page" do
  it "and see their results for nearest fuel station to Turing" do
    visit '/'

    select 'Turing'
    click_button 'Find Nearest Station'

    expect(page).to eq('/search')

    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('Fuel Type')
    expect(page).to have_content('Access Times')
    expect(page).to have_content('Distance 0.1 miles')
    expect(page).to have_content('Travel time from Turing')
    expect(page).to have_content('HTML direction instructions to get to that fueling station')
  end
end
