class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product

  def index
    @products = Product.all.order(:title)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }

        @products = Product.all.order(:title)
        ActionCable.server.broadcast 'products',
          html: render_to_string('store/index', layout: false)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to products_url, notice: "This product is in the shopping cart." }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def invalid_product
    logger.error "Attempt to access invalid product ##{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid product'
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price)
  end
end
