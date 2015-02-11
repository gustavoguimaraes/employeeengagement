When(/^I propose a post$/) do
  visit new_post_path
  fill_in "Url", with: "http://www.clarin.com"
  click_on "Create Post"
end

Then(/^I should not see the post$/) do
	expect(page).not_to have_content("Clarin")
end

Then (/I should see the post to approve or reject it$/) do
	within "a.btn.btn-success" do
		expect(page).to have_content("approve it")
	end
end

When(/^the post is approved$/) do
    @approved_post = FactoryGirl.create(:approved)
end

Then(/^I should see the post$/) do
  expect(page).to have_content("Blah")
end
