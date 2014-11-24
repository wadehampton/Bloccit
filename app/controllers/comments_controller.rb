class CommentsController < ApplicationController
  def create
   @comment = Comment.new(comment_params)
   @topic = Topic.find(params[:topic_id])
   @post = Post.find(params[:post_id])

   @comment.post = @post
   @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
    end 
    redirect_to [@topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :topic_id)
  end
end
