class PostsController < ApplicationController
	before_action :find_post, only: [:show,:edit,:destroy,:update] 
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post, notice:"Good Job seço article saved."
		else
			render 'new', notice:"unable to save :("
		end
	end
	def show
	end

	def edit
	end
	def should_generate_new_friedly_id?
  	 slug.blank? || title_changed?
	end
	


	def update
		if @post.update post_params
			redirect_to @post, notice: "Your article is succesfully saved."
		else
			render "edit"
		end
	end


	def destroy
		@post.destroy
		redirect_to posts_path

	end

	private

	def post_params
		params.require(:post).permit(:title,:content, :slug)
	end
	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
