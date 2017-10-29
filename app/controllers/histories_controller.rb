class HistoriesController < ApplicationController
  def index
    @histories = History.all
  end

  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    if @history.save
      redirect_to root_path
    else
      render :translate
    end
  end

  private

  def history_params
    params.require(:history).permit(:word, :translate)
  end
end
