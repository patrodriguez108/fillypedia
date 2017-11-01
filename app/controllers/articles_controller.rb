class ArticlesController < ApplicationController
  def index
    # @articles = Article.all.order('created_at DESC')
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
