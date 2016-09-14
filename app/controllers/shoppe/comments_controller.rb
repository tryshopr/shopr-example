module Shopr
  class CommentsController < shopr::ApplicationController

    def index
      @product = Shopr::Product.find(params[:product_id])
      @comments = @product.comments
    end

    def destroy
      @comment = shopr::Comment.find(params[:id])
      @comment.destroy
      redirect_to :back, flash: { notice: t('shopr.comments.destroy_notice') }
    end
  end
end