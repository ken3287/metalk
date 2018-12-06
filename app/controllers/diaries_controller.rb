class DiariesController < ApplicationController

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
    @diary = Diary.find(params[:id])
      @diary.destroy if @diary.user_id == current_user.id
      redirect_to user_diaries_path, notice: 'Delete completed'

  end

  private

  def diary_params
    params.require(:diary).permit(:title, :sentence).merge(user_id: params[:user_id])
  end

end
