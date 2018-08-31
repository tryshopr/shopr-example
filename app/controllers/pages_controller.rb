class PagesController < ApplicationController
  def home
    @products = Shopr::Product.active.featured.includes(:product_categories, :variants).root
    @comments = Shopr::Comment.all.order('created_at DESC').limit(5)
  end
end
