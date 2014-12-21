class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider, :user_id
  validates_uniqueness_of :uid, scope: :provider

  def self.find_auth(auth, current_user)
    find_or_create_by(uid: auth.uid, provider: auth.provider, user_id: current_user.id)
  end

end
