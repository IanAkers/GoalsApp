require 'spec_helper'
require 'rails_helper'



feature "user can create a goal" do

  before(:each) do
    sign_up("testname")
  end

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

  before(:each) do
    sign_up("testname")
  end

  scenario "doesn't show private goals" do
    create_goal("Brush teeth once a week", "Private")
    sign_out
    sign_up("othername")
    visit("/goals")
    expect(page).not_to have_content("Brush teeth once a week")
  end

  scenario "does show public goals" do
    create_goal("Give to charity", "Public")
    sign_out
    sign_up("othername")
    visit("/goals")
    expect(page).to have_content("Give to charity")
  end
end

feature "shows username on goals index" do

  before(:each) do
    sign_up("testname")
  end

  scenario "shows name when public goal is posted" do
    create_goal("Wear more hats", "Public")
    sign_out
    sign_up("othername")
    visit("/goals")
    expect(page).to have_content("testname")
  end
end

feature "user can destroy goals" do

  before(:each) do
    sign_up("testname")
  end

  scenario "user can destroy own goals" do
    create_goal("Wear less hats", "Public")
    click_link('My Profile')
    click_button("destroy_Wear_less_hats")
    expect(page).not_to have_content("Wear less hats")
  end

  scenario "user can't destroy other users' goals" do
    create_goal("Learn to juggle", "Public")
    sign_out
    sign_up("othername")
    visit("/goals")
    click_link "testname"
    expect(page).not_to have_button("destroy_Learn_to_juggle")
  end
end

feature "user can update goals" do

  before(:each) do
    sign_up("testname")
    create_goal("Edit more goals", "Public")
    click_link("My Profile")
    click_button("edit_Edit_more_goals")
  end

  scenario "edit page exists" do
    expect(page).to have_content("Edit Goal")
  end

  scenario "user can change goal content" do
    fill_in("Content", with: "Learn Ruby")
    click_button("Update Goal")
    expect(page).to have_content("Learn Ruby")
  end

  scenario "old goal changes when goal is updated" do
    fill_in("Content", with: "Learn Ruby")
    click_button("Update Goal")
    expect(page).not_to have_content("Edit more goals")
  end

  scenario "user can change goal privacy type" do
    choose("Private")
    click_button("Update Goal")
    sign_out
    sign_up("othername")
    expect(page).not_to have_content("Edit more goals")
  end

  scenario "user can change goal status" do
    choose("Completed")
    click_button("Update Goal")
    expect(page).to have_content("Completed")
  end
end
