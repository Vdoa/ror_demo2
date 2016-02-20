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
  def edit
    @product=Product.find(params[:id])
  end
  def update
    @product=Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
      else
        render :edit
    end
  end
  def destroy
    @product=Product.find(params[:id])
    product_name=@product.name
    @product.destroy
    flash[:notice] = "Product with name: #{product_name} is successfuly deleted :)"
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description)
    end


end
