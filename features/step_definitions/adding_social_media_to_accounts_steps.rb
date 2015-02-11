Given(/^I am logged in as an? (user|admin)$/) do |user_type|
  @user = FactoryGirl.create(:"#{user_type}")
  login_as(@user, scope: :user)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^there should be button "(.*?)"$/) do |text|
    expect(page).to have_button(text)
end

When(/^I click on "(.*?)"$/) do |button_with_text|
  click_on(button_with_text)
end