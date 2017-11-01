class VersionsController < ApplicationController
  def show
    @article = Article.find(params[:article_id])
    @version = Version.find(params[:id])
  end

end
