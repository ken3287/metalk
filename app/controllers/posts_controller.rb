class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_user, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path, notice: 'Update completed'
    else
      redirect_to user_posts_path, notice: 'Can not update'
    end
  end

  def destroy
    if @post.destroy
      redirect_to user_posts_path, notice: 'Delete completed'
    else
      redirect_to user_posts_path, notice: 'Can not delete'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: params[:user_id])
  end

  def confirm_user
    if @post = Post.find(params[:id])
      unless @post.user_id == current_user.id
        redirect_to user_posts_path, notice: 'You must be logged in'
      end
    else
      redirect_to user_posts_path, notice: 'This diary could not find'
    end
  end

end
