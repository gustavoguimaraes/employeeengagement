Given(/^I am a company admin$/) do
  @user = FactoryGirl.create(:company_admin)
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

When(/^I am on the dashboard page$/) do
  visit dashboard_path
end