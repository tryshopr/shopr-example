class ProductsController < ApplicationController
  
  before_filter do
    if params[:category_id]
      @product_category = Shopr::ProductCategory.where(:permalink => params[:category_id]).first!
    end
    if @product_category && params[:id]
      @product = @product_category.products.where(:permalink => params[:id]).active.first!      
    end
  end
  
  def index
    @products = @product_category.products.includes(:product_categories, :variants).root.active
  end
  
  def filter
    @products = Shopr::Product.active.with_attributes(params[:key].to_s, params[:value].to_s)
  end

  def categories
    @product_categories = Shopr::ProductCategory.ordered
  end
  
  def show
    @attributes = @product.product_attributes.public.to_a
    @comments = @product.comments
    @new_comment = @product.comments.build
    @extra_attachments = @product.default_image.present? ? @product.attachments.where.not(id: @product.default_image.id) : @product.attachments
  end

  def change_variant
    variant = @product.variants.find(params[:variant])
    render partial: "products/variants", locals: { product: @product, variant: variant }, layout: false, status: 200
  end

  def add_to_basket
    product_to_order = params[:variant] ? @product.variants.find(params[:variant].to_i) : @product
    current_order.order_items.add_item(product_to_order, params[:quantity].blank? ? 1 : params[:quantity].to_i)
    respond_to do |wants|
      wants.html { redirect_to request.referer }
      wants.json { render :json => {:added => true} }
    end
  rescue shopr::Errors::NotEnoughStock => e
    respond_to do |wants|
      wants.html { redirect_to request.referer, :alert => "We're sorry but we don't have enough stock to add that many products. We currently have #{e.available_stock} item(s) in stock. Please try again."}
      wants.json { render :json => {:error => 'NotEnoughStock', :available_stock => e.available_stock}}
    end
  end

  def strip_html(str)
    document = Nokogiri::HTML.parse(str)
    document.css("br").each { |node| node.replace("\n") }
    document.text
  end
  
end
