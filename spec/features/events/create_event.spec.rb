
require 'spec_helper'

describe "Creating an event" do
   it "redirects to the todo list index page on success" do
     visit new_event_path

     fill_in "Event's name", with: 'Rent a plane'
     fill_in "What is the total price", with: 200
     click_button "Add participant"
     fill_in "Participant's first name", with: "John"
     fill_in "Participant's monthly pay", with: 2300
     click_button "See result"

     expect(page).to have_content('Your salary together:')
   end



end
