require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  it { should respond_to(:email) }
  it { should respond_to(:password) }
end
