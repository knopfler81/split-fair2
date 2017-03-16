require 'spec_helper'
require 'rails_helper'


describe "Creating an event", js: true do
  it "redirects on result page on success" do
    visit "/"
    click_link "Create a new event"
    expect(page).to have_content('Wanna share fair?')

    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: 200
    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: "John"
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: 5600
    click_button "See result"

    expect(page).to have_content('Your salary together:')
 end
end
