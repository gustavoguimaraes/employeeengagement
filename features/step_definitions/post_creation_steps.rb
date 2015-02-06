When(/^I propose a post$/) do
  visit new_post_path
  fill_in "Url", with: "http://www.clarin.com"
  click_on "Create Post"
end

Then(/^the state of the post should be pending$/) do
	expect(page).to have_content("Clarin")
end