class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.save ? (redirect_to @post) : (redirect_to new_post_path)
  end

  def show
    set_post
  end

  def edit
    set_post
  end

  def update
    set_post

    @post.update_attributes(post_params) ? (redirect_to @post) : (render :edit)
  end

  def destroy
    set_post

    @post.destroy

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
