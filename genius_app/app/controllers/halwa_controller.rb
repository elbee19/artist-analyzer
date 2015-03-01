class HalwaController < ApplicationController
	def index
		#render "application/dummy"
		respond_to do |format|
			format.html
			format.json { render :json => "{\"a\":2}" }
			format.lala { render :json => "{\"a\":21}" }
		end
		puts "newlol"
	end
end