class ArticlesController < ApplicationController

  def index
    p "i am in index articles"
    p params[:search]
    @search_results = Version.search(params[:search]) if params[:search]
    p @search_result
  end

  def new
    @article = Article.create
    @version = Version.new
  end

  def show
    @article = Article.find(params[:id])
  end

end
