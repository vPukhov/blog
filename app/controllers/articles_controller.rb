class ArticlesController < ApplicationController

  def index
    @list_of_articles = Article.all.order(created_at: :desc)
  end

  def new 
  end

  def create
    @article = Article.new article_params

    if @article.valid?
      @article.save

      redirect_to action: 'index'
    else
      render action: 'new'
    end

  end

  def show
    render plain: params[:id]
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end  

end
