class WatsonToneService
  def initialize(text)
    @text=text
  end

  def get_tone
    get_json("/tone-analyzer/api/v3/tone?version=2017-09-21")
  end


private
  def conn
    url = "https://gateway.watsonplatform.net"
    Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = ENV['WATSON_DEV_BEARER_KEY']
      faraday.headers['Content-Type'] = 'application/json'
      faraday.body = '{"text": "#{@text}"}'
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.post(url).body, symbolize_names: true)
  end
end
