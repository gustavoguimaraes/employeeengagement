Given(/^I am a visitor$/) do
  visit root_path
end

When(/^I am on the registration page$/) do
  visit "/users/sign_up"
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
  visit sign_in_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_on "Sign in"
end