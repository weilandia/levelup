class UserTrack < ActiveRecord::Base
  store_accessor :data
  belongs_to :track
  belongs_to :user
end
