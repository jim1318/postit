class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show, :vote]
  before_action :require_creator, only: [:edit, :update]

  def index
    @posts = Post.limit(Post::PER_PAGE).offset(params[:offset])  #.sort_by{ |x| x.total_votes }.reverse
    @pages = Post.all.size / Post::PER_PAGE
    remain = Post.all.size % Post::PER_PAGE
    if remain > 0
      @pages = @pages + 1
    end

  end

  def show
    @comments = @post.comments
    @comment = Comment.new
    respond_to do |format|
      format.html {  }
      format.json { render json: @comment }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "The post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote

    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = "Your vote was counted"
    else
      flash[:notice] = "there was a problem counting your vote"
    end


    respond_to do |format|
      format.html { redirect_to :back, notice: "Your vote was counted" }
      format.js
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids:[])
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end

  def require_creator
    access_denied unless logged_in? && (current_user == @post.creator || current_user.admin?)
  end

end
