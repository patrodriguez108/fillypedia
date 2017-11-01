class VersionsController < ApplicationController

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
    params.require(:version).permit(:title, :body)
  end

end
