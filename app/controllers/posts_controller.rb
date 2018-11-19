class PostsController < ApplicationController

  def index
    @posts = current_user.posts.includes(:user)
    binding.pry
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    binding.pry
    redirect_to root_path
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: params[:user_id])
  end

end
