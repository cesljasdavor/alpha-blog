class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    Article.create(article_params)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end