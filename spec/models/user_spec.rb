require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:name) }
  it { should have_many :user_roles }
  it { should have_many :roles }
  it { should have_many :authorizations }
end
