class Media
	attr_accessor :media_provider, :media_url

	def initialize(media=nil)
		if !media.nil?
			@media_provider = media.provider
			@media_url = media.url
		end
	end

	def to_json(options={})
		if @media_url.nil? || @media_provider.nil?
			nil.to_json
		else
			{
				:provider => @media_provider,
				:url => @media_url
			}.to_json
		end
	end
end
