class Authorization < ActiveRecord::Base
  belongs_to :user
  after_create :fetch_details

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end

  def fetch_details_from_facebook
    FacebookService.new(self).fetch_data
  end

  def fetch_details_from_github
  end
end
