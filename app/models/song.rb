class Song
	def initialize(title,lyrics,media,description,url)
		@title = title
		@sentiment = get_sentiment(lyrics)
		@media = []
		media.each{ |x| @media << Media.new(x) }
		@description = description
		@genius_url = url
	end

	def to_json(options={})
		{
			:title => @title,
			:media => @media,
			:sentiment => @sentiment,
			:description => @description,
			:genius_url => @genius_url
		}.to_json
	end

	def call_api(endpoint, parameters)
	  url = URI.parse("https://api.aylien.com/api/v1/#{endpoint}")
	  headers = {
	      "Accept"                           =>   "application/json",
	      "X-AYLIEN-TextAPI-Application-ID"  =>   Rails.application.secrets.APPLICATION_ID,
	      "X-AYLIEN-TextAPI-Application-Key" =>   Rails.application.secrets.APPLICATION_KEY
	  }

	  http = Net::HTTP.new(url.host, url.port)
	  http.use_ssl = true
	  request = Net::HTTP::Post.new(url.request_uri)
	  request.initialize_http_header(headers)
	  request.set_form_data(parameters)

	  response = http.request(request)

	  JSON.parse response.body
	end

	def get_sentiment(lyrics)
		parameters = {"text" => lyrics}
		sentiment = call_api("sentiment", parameters)
		sentiment["polarity"] == "negative" ? -1 : 1
	end

end