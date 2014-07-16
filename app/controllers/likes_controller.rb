class LikesController < ApplicationController
 
	def create
		@post = Post.find_by_title(params[:post_id].gsub("_", " "))
		@post.likes.create
		WebsocketRails[:likes].trigger 'new', { id: @post.id, new_like_count: @post.likes.count}
		redirect_to '/posts' 
	end

end
    