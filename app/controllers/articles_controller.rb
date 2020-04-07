class ArticlesController < ApplicationController
  # $ rails routes, has predefined URI patterns such as articles#new with you can define here to hook into.
  
  def new
  end

  def create
    # When the submit button is clicked the page renders with the parameter key/values for each form field
    render plain: params[:article].inspect
  end
end
