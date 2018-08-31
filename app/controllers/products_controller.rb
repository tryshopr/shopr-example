class ProductsController < ApplicationController
  before_action do
    @product_category = Shopr::ProductCategory.where(permalink: params[:category_id]).first! if params[:category_id]
    if @product_category && params[:product_id]
      @product = @product_category.products.where(permalink: params[:product_id]).active.first!
    end
  end

  def index
    @products = @product_category.products.includes(:product_categories, :variants).root.active
    @products = @products.page(params[:page]).per(12)
  end

  def filter
    @products = Shopr::Product.active.with_attributes(params[:key].to_s, params[:value].to_s)
    @products = @products.page(params[:page]).per(16)
  end

  def categories
    @product_categories = Shopr::ProductCategory.ordered
  end

  def show
    @comments = @product.comments
    @new_comment = @product.comments.build
    @attributes = @product.product_attributes.public.to_a
    @extra_attachments = @product.default_image.present? ? @product.attachments.where.not(id: @product.default_image.id) : @product.attachments
  end

  def add_to_basket
    product_to_order = params[:variant] ? @product.variants.find(params[:variant].to_i) : @product
    current_order.order_items.add_item(product_to_order, params[:quantity].blank? ? 1 : params[:quantity].to_i)
    respond_to do |wants|
      wants.html { redirect_to request.referer }
      wants.json { render json: { added: true } }
    end
  rescue Shopr::Errors::NotEnoughStock => e
    respond_to do |wants|
      wants.html { redirect_to request.referer, alert: "We're sorry but we don't have enough stock to add that many products. We currently have #{e.available_stock} item(s) in stock. Please try again." }
      wants.json { render json: { error: 'NotEnoughStock', available_stock: e.available_stock } }
    end
  end
end
