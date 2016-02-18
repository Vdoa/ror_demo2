class ProductsController < ApplicationController
  def index
    @products_count = Product.count
    @products = Product.all
  end

  def show
    product_id =params[:id]
    @product = Product.find(product_id)
  end

  def new
  @product = Product.new

  end
  def create
  product = Product.new(product_params)
    if product.save
      redirect_to(products_path())
    else
      flash[:error]='Product create faild!!!:('
      render :new
    end
  end
  private

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end


end
