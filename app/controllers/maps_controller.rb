class MapsController < ApplicationController
	def show
		@post = Post.find_by_title(params[:post_id].gsub("_", " "))		
	end
end
