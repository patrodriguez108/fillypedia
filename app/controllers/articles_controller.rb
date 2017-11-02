class ArticlesController < ApplicationController

  def index
    @categories = Category.all
    @search_results = Version.search(params[:search]) if params[:search]
  end

  def new
    @article = Article.new
    @version = Version.new
  end

  def create
    authenticate!
    @version = Version.new(version_params)
    if !@version.title.empty? && !@version.body.empty?
      @article = Article.create
      Category.find(params[:category]).articles << @article
      @version.author = current_user
      @version.article = @article
      @version.save
      if params[:is_published] == "1"
        @article.is_published = true
        @article.published_version_id = @version.id
        @article.save
      end
      redirect_to root_path, notice: "The article has been successfully created"
    else
      @failsauce = "To make a new article, you must write a title and body."
      render new_article_path
    end

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

  private
  def version_params
    params.require(:version).permit(:title, :body, :photo_url)
  end

end
