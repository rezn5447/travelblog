class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root
  end






  private


  def post_params
    params.require(:post).permit(:title, :body, current_user.id)
  end
end
