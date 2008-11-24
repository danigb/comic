class ViewController < ApplicationController

  def show
    render :text => path
  end

  def debug
  end

  private
  def path
    path = params[:path] || []
    "/#{path.join('/')}"
  end
end
