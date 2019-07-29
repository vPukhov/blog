class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    @article = Article.find(params[:article_id])
    
    comment = @article.comments.new(comment_params)
    comment.author = current_user.username
    comment.save

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)   
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end

end
