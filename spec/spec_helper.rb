
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end

def sign_up(username)
  visit('/users/new')
  fill_in "username", :with => username
  fill_in "password", :with => "abcdef"
  click_on "Create User"
end

def sign_in(username)
  visit("/session/new")
  fill_in "username", :with => username
  fill_in "password", :with => "abcdef"
  click_on "Sign In"
end

def sign_out
  click_on "Sign Out"
end

def create_goal(goal_content, goal_type)
  visit("/goals")
  click_button("New Goal")
  fill_in("Content", :with => goal_content)
  choose(goal_type)
  click_button("Create Goal")
end
