class CommentsController < ApplicationController  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.js
      end
    else

    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end 