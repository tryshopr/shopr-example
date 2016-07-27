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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render js: "alert('error deleting comment');"
    end
  end

  private

  def safe_params
    params[:comment].permit(:title, :commenter, :comment, :commentable_id, :commentable_type)
  end
end
