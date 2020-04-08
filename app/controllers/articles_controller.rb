class ArticlesController < ApplicationController
  # $ rails routes, has predefined URI patterns such as articles#new with you can define here to hook into.

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end 


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article  
    else
      render 'new'  
    end  

    # When the submit button is clicked the page renders with the parameter key/values for each form field
    # render plain: params[:article].inspect
  end

  private
  # the method is often made private to make sure it can't be called outside its intended context. 
    def article_params
      params.require(:article).permit(:title, :text)
    end  
end
