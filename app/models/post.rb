class Post < ActiveRecord::Base
  enum state: [ :pending, :approved, :rejected ]
  belongs_to :user

	def post_approved
		"approve it"
	end

	def post_rejected
		"rejected it"
	end

end

