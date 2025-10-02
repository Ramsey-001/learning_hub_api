class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post, include: :comments
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save 
      render json: post, status: :created
    else
      render json: {errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :completed)
  end
end
