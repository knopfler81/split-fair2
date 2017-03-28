require 'spec_helper'
require 'rails_helper'


describe "navbar" do
  it "should have the new event link" do
    visit root_path
    expect(page).to have_content('New event')
  end
  it "should have the logo" do
    visit root_path
    find(".fa-money")
  end
end

