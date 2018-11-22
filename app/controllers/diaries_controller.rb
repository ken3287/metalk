class DiariesController < ApplicationController

  def index
  end

  def new
    @diaries = Diary.new
  end

end
