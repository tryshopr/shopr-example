module Shopr
  class CommentsController < Shopr::ApplicationController
    def index
      @product = Shopr::Product.find(params[:product_id])
      @comments = @product.comments
    end

    def destroy
      @comment = Shopr::Comment.find(params[:id])
      @comment.destroy
      redirect_to :back, flash: { notice: t('shopr.comments.destroy_notice') }
    end
  end
end
