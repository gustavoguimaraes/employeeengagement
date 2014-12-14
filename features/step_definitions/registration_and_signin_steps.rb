Given(/^I am a visitor$/) do
  visit root_path
end

When(/^I am on the registration page$/) do
  visit register_path
end

When(/^I register to the site$/) do
  new_user = FactoryGirl.build(:user)
  fill_in "Email", with: new_user.email
  fill_in "Password", with: new_user.password
  fill_in "Password confirmation", with: new_user.password
  click_on "Sign up"
end

Then(/^I should see the app dashboard information$/) do
  expect(page).to have_content("Hello You")
end

Given(/^I am a user$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I login$/) do
  visit login_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_on "Sign in"
end

Given(/^I am an Admin$/) do
  @admin = FactoryGirl.create(:admin_user)
end

When(/^I login as an admin$/) do
  visit '/admin'
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_on "Login"
end

Then(/^I should see the Admin page$/) do
  expect(page).to have_content("Dashboard")
end