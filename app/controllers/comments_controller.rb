class CommentsController < ApplicationController
  def create
   @comment = Comment.new(comment_params)
   @post = Post.find(params[:post_id])
   @topic = @post.topic

   @comment.post = @post
   @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment. Please try again."
    end 
    redirect_to [@topic, @post]
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted, try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :topic_id)
  end
end
