module Shoppe
  class CommentsController < Shoppe::ApplicationController

    def index
      @product = Shoppe::Product.find(params[:product_id])
      @comments = @product.comments
    end

    def destroy
      @comment = Shoppe::Comment.find(params[:id])
      @comment.destroy
      redirect_to :back, flash: { notice: t('shoppe.comments.destroy_notice') }
    end
  end
end