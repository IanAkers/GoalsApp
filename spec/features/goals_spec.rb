require 'spec_helper'
require 'rails_helper'

before(:each) do
  sign_up("testname")
  sign_in("testname")
end

feature "user can create a goal" do

  scenario "shows create goal button on homepage" do
    visit("/goals")
    click_button("New Goal")
    expect(page).to have_content("New Goal")
  end

  scenario "must be signed in to create goal" do
    sign_out
    visit("/goals")
    expect(page).not_to have_content("New Goal")
  end

  scenario "shows goal content" do
    create_goal("Climb Kilamanjaro", "Public")
    expect(page).to have_content("Climb Kilamanjaro")
  end
end

feature "has goal privacy" do
