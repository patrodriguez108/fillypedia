class ArticlesController < ApplicationController

  def index
    @search_result = Version.search(params[:search]) if params[:search]
    p "_____________________"
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
