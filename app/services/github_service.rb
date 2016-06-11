class GithubService
  def initialize(auth)
    @auth = auth
    @_connection = Faraday.new("https://api.github.com")
    connection.headers = { "Authorization" => "token #{@auth.token}", "Content-Type" => "application/json" }
  end

  def get(path, params=nil)
    parse(connection.get(path, params))
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_name: true)
    end

    def connection
      @_connection
    end
end
