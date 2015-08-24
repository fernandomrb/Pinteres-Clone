class PostsController < ApplicationController
	before_action :set_post, only: [:show, :update, :edit, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			redirect_to 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Guardado exitosamente"
		else
			render 'edit'
		end	
	end

	def destroy
		@post.destroy 
		redirect_to root_path, notice: "Post eliminado correctamente"
	end

	private 

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params 
		params.require(:post).permit(:title, :description)
	end

end
