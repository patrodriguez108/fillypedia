class VersionsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
  end

  def new
    @article = Article.find(params[:article_id])
    @previous_version = Version.find(@article.published_version_id)
    @previous_version.body
    @version = Version.new(title: @previous_version.title, photo_url: @previous_version.photo_url ,body: @previous_version.body)
  end

  def index
    @article = Article.find(params[:article_id])
    @versions = @article.versions
  end

  def create
    @article = Article.find(params[:article_id])
    @version = Version.new(version_params)
    @version.author = current_user
    @version.article = @article
    if @version.save
      if params[:is_published] == "1"
        @article.is_published = true
        @article.published_version_id = @version.id
        @article.save
      end
      redirect_to root_path, notice: "The version has been successfully created"
    else
      render "new"
    end
  end

  private
  def version_params
    params.require(:version).permit(:title, :body, :photo_url)
  end

end
