class CommentsController < Shoppe::ApplicationController
	def create
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Shoppe::Comment.new(safe_params)
    if @comment.save
      render partial: "comments/comment", locals: { comment: @comment }, layout: false, status: :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  def index
    @product = Shoppe::Product.find(params[:product_id])
    @comments = @product.comments
  end

  def destroy
    @comment = Shoppe::Comment.find(params[:id])
    @comment.destroy
    redirect_to :back, flash: { notice: t('shoppe.comments.destroy_notice') }
  end

  private

  def safe_params
    params[:comment].permit(:title, :commenter, :comment, :commentable_id, :commentable_type, :rating)
  end
end