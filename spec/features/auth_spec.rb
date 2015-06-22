require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit('/users/new')
    expect(page).to have_content("Sign Up")
  end
end

feature "signing up a user" do

  scenario "shows username on the homepage after signup" do
    sign_up("testname")
    expect(page).to have_content("testname")
  end
end


feature "signing in" do

  scenario "shows username on the homepage after signin" do
    sign_up("testname")
    sign_in("testname")
    expect(page).to have_content("testname")
  end

end

feature "signing out" do

  scenario "begins with signed out state" do
    visit("/users/new")
    expect(page).to have_content("Sign In")
  end


  scenario "doesn't show username on the homepage after signout" do
    sign_up("testname")
    sign_in("testname")
    sign_out
    expect(page).not_to have_content("testname")
  end
end
