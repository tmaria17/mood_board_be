class IbmApiAuthService
  def initialize(user_id=nil)
    @apikey = ENV['WATSON_DEV_API_KEY']
    @user_id = user_id
    @_refresh_token = nil
    @access_token = nil
  end

  def refresh_token #cache this value?
    @_refresh_token ||= User.find(@user_id).refresh_token
  end

  def refresh_access_token #cache this value after 1 hour - methid is called every time update is hit

    Rails.cache.fetch("#{@user_id}/authorization_token", expires_in: 1.hours) do
      result = get_json(
        conn.post do |req|
          req.url "identity/token"
          req.body = URI.encode_www_form({ grant_type: 'refresh_token', refresh_token: refresh_token})
        end.body)
      @access_token = result[:access_token]
    end
    
  end

  def access_information
    get_json(
      conn.post do |req|
        req.url "identity/token"
        req.body = URI.encode_www_form({ grant_type: 'urn:ibm:params:oauth:grant-type:apikey', apikey: @apikey})
      end.body)
  end

private
  def conn
    url = "https://iam.bluemix.net/"
    Faraday.new(url: url) do |faraday|
      faraday.headers['Authorization'] = 'Basic Yng6Yng='
      faraday.headers['Content-Type'] = 'application/x-www-form-urlencoded'
      faraday.headers['Accept'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
