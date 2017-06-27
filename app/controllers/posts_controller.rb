class PostsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :ensure_author, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @subs = Sub.all
    @post.user_id = current_user.id

    if @post.save
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def ensure_author
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless current_user.id == @post.author.id
  end
end
