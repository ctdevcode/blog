class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
  def show
  end

  def index
		@post = Post.all
  end

  def new
		@post = Post.new
  end

  def create
		@post = Post.create(post_params)
		if @post.save
			flash[:notice] = "Post was created successfully!"
			redirect_to @post
		else 
			flash.now[:alert] = "Post was not created"
			render 'new'
		end
  end

  def edit
  end

  def update
		if @post.update(post_params)
			flash[:notice] = "Post was edited successfully!"
			redirect_to @post
		else 
			flash.now[:alert] = "Post was not edited"
			render 'edit'
		end
  end

  def destroy
		@post.destroy
		flash[:notice] = "The post was deleted successfully"
		redirect_to timeline_path
  end

	def timeline
		@posts = Post.all
	end


		private	

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
end
