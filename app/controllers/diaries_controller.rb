class DiariesController < ApplicationController
  before_action :confirm_user, only: [:destroy]

  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.new(diary_params)

      if @diary.save
        redirect_to user_diaries_path, notice: 'Save a diary'
      else
        render :new, notice: 'Can not save'
      end

  end

  def destroy
      @diary.destroy
      redirect_to user_diaries_path, notice: 'Delete completed'
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :sentence).merge(user_id: params[:user_id])
  end

  def confirm_user
    @diary = Diary.find(params[:id])
    unless @diary.user_id == current_user.id
      redirect_to user_diaries_path, notice: 'Can not delete'
    end
  end

end
