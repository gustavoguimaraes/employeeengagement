FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "testthis"
    company_id 1

		factory :company_admin do
	    role "company_admin"
		end

	end
end
