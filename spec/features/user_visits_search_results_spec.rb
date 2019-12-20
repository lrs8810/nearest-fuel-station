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

    expect(current_path).to eq('/search')

    expect(page).to have_content('Name')
    expect(page).to have_content('Address')
    expect(page).to have_content('Fuel Type')
    expect(page).to have_content('Access Times')
    expect(page).to have_content('Distance 0.1 miles')
    expect(page).to have_content('Travel time from Turing')
    expect(page).to have_content('HTML direction instructions to get to that fueling station')
  end
end
