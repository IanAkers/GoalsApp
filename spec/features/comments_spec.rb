require 'spec_helper'
require 'rails_helper'

feature "can comment on others' goals" do
  before(:each) do
    sign_up("testname")
    create_goal("Edit more goals", "Public")
    sign_out
    sign_up("othername")
    click_link("testname")
  end

  scenario "has link to comment" do
    expect(page).to have_button("Comment on Edit more goals")
  end

  scenario "comments show up on user page" do
    click_button("Comment on Edit more goals")
    fill_in("Comment", with: "Ur dum1")
    click_button("Make Comment")
    expect(page).to have_content("Ur dum1")
  end

  scenario "comments can't be empty" do
    click_button("Comment on Edit more goals")
    click_button("Make Comment")
    expect(page).to have_content("Comment can't be blank.")
  end
end

feature "can comment on user" do
  before(:each) do
    sign_up("testname")
    create_goal("Edit more goals", "Public")
    sign_out
    sign_up("othername")
    click_link("testname")
  end

  scenario "has link to comment on user" do
    expect(page).to have_content("Comment on testname")
  end

  scenario "comments show up on user page" do
    click_button("Comment on testname")
    fill_in("Comment", with: "asdf")
    click_button("Make Comment")
    expect(page).to have_content("asdf")
  end

  scenario "comments can't be empty" do
    click_button("Comment on testname")
    click_button("Make Comment")
    expect(page).to have_content("Comment can't be blank.")
  end

end
