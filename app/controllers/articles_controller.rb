class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:index, :new, :create]

  def index
    @list_of_articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def new 
  end

  def create
    @article = Article.new article_params
    @article.username = current_user.username

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end

  end

  def edit
    @article = Article.find(params[:id])  
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end  

end
