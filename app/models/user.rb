class User < ActiveRecord::Base
  enum role: [:user, :company_admin]
  has_many :identities, dependent: :destroy
  has_many :posts, dependent: :destroy
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end
