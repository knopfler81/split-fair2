require 'spec_helper'
require 'rails_helper'


describe "The home page" do
  it "has a title"  do
    visit "/"
    expect(page).to have_content("Split fair")
  end

  it "has a description" do
    visit "/"
    expect(page).to have_content("Some of your friends could be less wealthy than you and they can't afford fun activities... They don't feel comfortable being invited, so let them take part according to their incomes...")
  end

  it "has a link to create an event" do
    visit "/"
    expect(page).to have_content("Create a new event")
  end
end

