class PostsController < ApplicationController
  def index
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
  end
end
