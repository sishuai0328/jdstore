class ProductsController < ApplicationController

  def index
    @products = case params[:order]
            when 'by_lower_bound'
              Product.order('price DESC')
            when 'by_upper_bound'
              Product.order('price ASC')
            else
              Product.order('created_at DESC')              
            end

    if params[:search]
      @products = Product.search(params[:search])
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
      redirect_to :back
  end

  def favorites
    @product = Product.find(params[:id])
    if !current_user.is_favorite_of?(@product)
      current_user.favorite!(@product)
      flash[:notice] = "成功收藏，可以到我的收藏中查看"
    else
      flash[:warning] = "此商品已收藏!"
    end
      redirect_to :back
  end

  def unfavorite
    @product = Product.find(params[:id])
    if current_user.is_favorite_of?(@product)
      current_user.unfavorite!(@product)
      flash[:notice] = "已成功取消收藏!"
    else
      flash[:warning] = "此商品未被收藏!"
    end
      redirect_to :back
  end

end
