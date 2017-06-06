class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :favorites, :unfavorite]
  before_action :admin_required


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def destroy
      @product = Product.find(params[:id])
      @product.destroy
      flash[:alert] = " product deleted"
      redirect_to  :back
    end

    def update
        @product = Product.find(params[:id])
        @product.category_id = params[:category_id]

        if params[:photos] != nil
          @product.photos.destroy_all #need to destroy old pics first
          params[:photos]['avatar'].each do |a|
            @picture = @product.photos.create(:avatar => a)
          end

          @product.update(product_params)
          redirect_to admin_products_path

        elsif @product.update(product_params)
          redirect_to admin_products_path
        else
          render :edit
        end
      end

  def new
    @product = Product.new
    @categories = Category.all.map { |c| [c.name, c.id] }
    @photo = @product.photos.build #for multi-pics
  end


  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.category_id = params[:category_id]
    if @product.save
      if params[:photos] != nil
       params[:photos]['avatar'].each do |a|
         @photo = @product.photos.create(:avatar => a)
       end
     end
        redirect_to admin_products_path
    else
        render :new
    end
  end



  private

  def product_params
    params.require(:product).permit(:title, :category, :description, :quantity, :price, :image, :particulars, :category_id)
  end
end
