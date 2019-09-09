class CommentsController < ApplicationController

  # POST /articles/:article_id/comments/:id
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    CommentMailer.notify_comment(@article, @comment).deliver_now
    respond_to do |format|
      format.html {redirect_to article_path(@article)}
      format.js
    end
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to article_path(@article)}
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
