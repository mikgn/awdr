class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create update]
  before_action :set_line_item, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_line_item

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_index_url }
        format.js { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @line_item.update_quantity(params[:quantity_action])

    respond_to do |format|
      if @line_item.update(line_item_params)
        return destroy if @line_item.quantity < 1

        format.html { redirect_to store_index_url }
        format.json { render :show, status: :ok, location: @line_item }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to store_index_url }
      format.json { head :no_content }
    end
  end

  private

  def invalid_line_item
    logger.error "Attempt to access invalid line_item ##{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid line item'
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.fetch(:line_item, {}).permit(:product_id, :quantity_action)
  end
end
