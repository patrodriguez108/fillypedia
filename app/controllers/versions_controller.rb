class VersionsController < ApplicationController
  def show
    @article = Article.find()
    @version = Version.find()
  end

end
