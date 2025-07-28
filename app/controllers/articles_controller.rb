class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new

  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save
      redirect_to @article #автоматически редиректит на URL с id которое только что было добавленно "http://127.0.0.1:3000/articles/4"
    else
      render action: 'new'
    end
  end


  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
