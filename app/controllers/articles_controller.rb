class ArticlesController < ApplicationController

  def index
    @search_results = Version.search(params[:search]) if params[:search]
  end

  def new
    @article = Article.create
    @version = Version.new
  end

  def show
    # @article = Article.find(params[:id])
  end

  def destroy
    p params
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/'
  end

end
