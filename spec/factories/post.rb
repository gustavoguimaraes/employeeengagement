FactoryGirl.define do
  factory :post do
    user_id 1

	  factory :approved do
			url "www.clarin.com"
			content "Blah Blah"
	    state "approved"
	  end
  end
end