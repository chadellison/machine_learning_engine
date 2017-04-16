class HomeController < ApplicationController
  def index
    render :index
  end

  def create
    # Engine.new.train
    render :index
  end
end
