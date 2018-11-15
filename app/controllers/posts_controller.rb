class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    redirect_to root_path
  end

  def show
  end

  private

  def post_params
  end

end
