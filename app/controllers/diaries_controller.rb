class DiariesController < ApplicationController

  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    Diary.create(diary_params)
    redirect_to user_diaries_path
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :sentence).merge(user_id: params[:user_id])
  end

end
