class VersionsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
  end

  def index
    @article = Article.find(params[:article_id])
    @versions = @article.all
  end

  def create
    p params
    @article = Article.find(params[:article_id])
    @version = Version.new(version_params)
    @version.author = current_user
    @version.article = @article
    if @version.save
      redirect_to root_path, notice: "The article has been successfully created"
    else
      render "new"
    end
  end

  private
  def version_params
    params.require(:version).permit(:title, :body, :photo_url)
  end

end
