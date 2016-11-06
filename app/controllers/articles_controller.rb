class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :show, :update, :destroy]
  #svi ovi parametri dakle @article ili @articles se šalju u pripadne .html.erb datoteke prilikom poziva ovih funkcija
  #jer ih upravo one i pozivaju
  def index
    @articles = Article.all

    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def new
    @article = Article.new
  end

  def edit
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

  def update
    # moramo zapisati parametre
    if @article.update(article_params)
      flash[:notice] = "Article was sucessfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully destroyed"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end