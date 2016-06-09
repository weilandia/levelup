class UserService < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  store_accessor :service_data
end
