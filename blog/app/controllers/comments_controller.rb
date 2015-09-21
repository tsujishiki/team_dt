class CommentsController < ApplicationController
  
  # 用户验证
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  skip_before_action :authorize, only: :destroy
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
