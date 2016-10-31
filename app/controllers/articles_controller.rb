class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      #Izbaci da je nešto kreirano(ovo se ispusuje u wrapperu application.html.erb)
      flash[:notice] = "You have sucessfully created an artcile"
      redirect_to article_path(@article)
    else
      #ponovo renderaj new.html.erb
      render 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end