class ArticlesController < ApplicationController
  # $ rails routes, has predefined URI patterns such as
  # articles#new with you can define here to hook into.

  http_basic_authenticate_with name: 'me', password: 'secret', except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    # if the save doesn't validate we render the form through 'new'
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    # Redirect back to the show article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # redirecting back to the index
    redirect_to articles_path
  end

  private

  #  the method is often made private to make sure it can't be called
  # outside it's intended context.
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
