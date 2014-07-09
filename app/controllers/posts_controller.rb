class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:title, :description, :image))
		@post.user = current_user
		@post.save
		redirect_to '/posts'
	end

end
	