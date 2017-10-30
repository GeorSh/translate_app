class HistoriesController < ApplicationController
  
  def new
    @history = History.new
  end

  def create
    @history = History.new(histories_params)
    if @history.save
      flash[:success] = "History updated!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def histories_params
    params.fetch(:history, {}).permit(:word, :translate)
  end

end
