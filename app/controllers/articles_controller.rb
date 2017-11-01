class ArticlesController < ApplicationController
  def new
    @article = Article.create
    @version = Version.new
  end

end
