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
    if @post.save
      redirect_to root
    else
      redirect_to new_posts_path
    end
    #  respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  private
  def post_params
    params.require(:post).permit(:title, :body, current_user.id)
  end
end
