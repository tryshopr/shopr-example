class CommentsController < ApplicationController
	def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Shoppe::Comment.new(safe_params)
    if @comment.save
      render partial: "comments/comment", locals: { comment: @comment }, layout: false, status: :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  private

  def safe_params
    params[:comment].permit(:title, :commenter, :comment, :commentable_id, :commentable_type, :rating)
  end
end
