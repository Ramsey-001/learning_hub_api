class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create 
    post = Post.find(params_id)
    comment = post.comment.build(comment_params.merge(:user current_user ))
    if comment.save 
      render json: comment, status: :created
    else
      render json: {errors: comment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private 
    def comment_params
      params.require(:comment).permit(:content)
    end
end
