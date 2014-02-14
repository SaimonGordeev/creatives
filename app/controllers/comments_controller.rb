class CommentsController < ApplicationController
  before_filter

  def create
    comment = current_user.comments.new(comment_params)
    comment.creative_id = params[:id]
    comment.save
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
