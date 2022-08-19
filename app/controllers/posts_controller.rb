class PostsController < ApplicationController
  def show
		@post = Post.find(params[:id])
  end

  def index
		@post = Post.all
  end

  def new
		@post = Post.new
  end

  def create
		@post = Post.create(params.require(:post).permit(:title, :body))
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
  end

  def destroy
  end

	def timeline
		@posts = Post.all
	end
end
