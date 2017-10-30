class HistoriesController < ApplicationController
  
  def new
    @history = History.new
  end

  def create
    #byebug
    p params
    @history = History.new(histories_params)
    if @history.save
      flash[:success] = "History updated!"
      redirect_to root_path
    else
      redirect_to root_path
      p 'n'
    end
  end

  private

  def histories_params
    params.fetch(:history, {}).permit(:user_id, :word, :translate)
  end

end
