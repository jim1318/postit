class CommentsController < ApplicationController
  def create
    binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = User.first ##FIX AFTER AUTHENTICATION

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end