class FacebookService
  def initialize(auth)
    @auth = auth
    @graph = Koala::Facebook::API.new(@auth.token)
    @facebook_data = @graph.get_object("me")
  end

  def fetch_data
    @auth.username = @facebook_data['username']
    @auth.save
  end
end
