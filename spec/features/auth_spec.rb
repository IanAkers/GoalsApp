require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit('/users/new')
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up("testname")
      expect(page).to have_content("testname")
    end
  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    sign_up("testname")
    sign_in("testname")
    expect(page).to have_content("testname")
  end

end

feature "logging out" do

  scenario "begins with signed out state" do
    visit("/users/new")
    expect(page).to have_content("Sign In")
  end


  scenario "doesn't show username on the homepage after signout"
    sign_up("testname")
    sign_in("testname")
    sign_out
    expect(page).not_to have_content("testname")
  end
end
