class ArticlesController < ApplicationController
  def new
    @article = Article.create
    @version = Version.new
  end

  def create
    @version = Version.new(version_params)
    # @version.author = current_user
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
