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

    click_link "Add a participant"

    find('.nested-fields:nth-child(2)').fill_in "Participant's first name", with: "John"
    find('.nested-fields:nth-child(2)').fill_in "Participant's monthly pay", with: 5600

    click_link "Add a participant"

    find('.nested-fields:nth-child(3)').fill_in "Participant's first name", with: "Peter"
    find('.nested-fields:nth-child(3)').fill_in "Participant's monthly pay", with: 900

    click_button "See result"

    expect(page).to have_content('Event succefully created!')
  end

  it "display an error message if event name is too short" do
    visit "events/new"
    fill_in :name, with: 'R'
    fill_in "What is the total price", with: 200

    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: "John"
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: 5600

    click_button "See result"

    expect(page).to have_content("Event's name is too short (minimum is 2 characters)")
  end

  it "display an error message if event total price is not present " do
    visit "events/new"
    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: ""

    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: "John"
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: 1500

    click_button "See result"

    expect(page).to have_content("What is the total price can't be blank")
  end

  it "display an error message if there is no participant" do
    visit "events/new"
    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: 200

    click_button "See result"

    expect(page).to have_content('You need to add participants')
  end

  it "display an error message if participant first_name is not present " do
    visit "events/new"
    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: 200

    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: ""
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: 5600

    click_button "See result"

    expect(page).to have_content("Participant's first name can't be blank")
  end

  it "display an error message if participant salary is not present " do
    visit "events/new"
    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: 200

    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: "John"
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: ""

    click_button "See result"

    expect(page).to have_content("Participant's monthly pay can't be blank")
  end

  it "display an error message if participant first_name is too short" do
    visit "events/new"
    fill_in :name, with: 'Rent a plane'
    fill_in "What is the total price", with: 200

    click_link "Add a participant"

    find('.nested-fields:nth-child(1)').fill_in "Participant's first name", with: "N"
    find('.nested-fields:nth-child(1)').fill_in "Participant's monthly pay", with: 5600

    click_button "See result"

    expect(page).to have_content("Participant's first name is too short (minimum is 2 characters)")
  end
end
