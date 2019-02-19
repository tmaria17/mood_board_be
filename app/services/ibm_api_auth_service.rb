class IbmApiAuthService
  def initialize
    @apikey = ENV['WATSON_DEV_API_KEY']
  end

  def access_information
    get_json(
      conn.post do |req|
        req.url "identity/token"
        req.body = URI.encode_www_form({ grant_type: 'urn:ibm:params:oauth:grant-type:apikey', apikey: @apikey})
      end.body)
  end

  def access_token
    access_information[:access_token]
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
