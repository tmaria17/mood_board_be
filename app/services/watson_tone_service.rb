class WatsonToneService
  def initialize(text)
    @text=text
  end

  def get_tone
    get_json(
      conn.post do |req|
        req.url "/tone-analyzer/api/v3/tone?version=2017-09-21"
        req.body = { text: @text }.to_json
      end.body)
  end

private
  def conn
    url = "https://gateway.watsonplatform.net"
    Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = ENV['WATSON_DEV_BEARER_KEY']
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(response)
    JSON.parse(response, symbolize_names: true)
  end
end
