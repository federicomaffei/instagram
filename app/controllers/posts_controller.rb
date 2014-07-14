class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:title, :description, :image, :tag_names, :address))
		@post.user = current_user
		@post.save
		redirect_to '/posts'
	end

	def show
		@post = Post.find_by_title(params[:id].gsub("_", " "))
	end

end
	