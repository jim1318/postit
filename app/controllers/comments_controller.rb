class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_comment, only: [:vote]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    if vote.valid?
      flash[:notice] = "Your vote was counted"
    else
      flash[:notice] = "there was a problem counting your vote"
    end

    redirect_to :back
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end