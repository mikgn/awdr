class CartsController < ApplicationController
  before_action :set_current_cart, only: %i[show edit update destroy]

  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to store_index_url }
      format.json { head :no_content }
      # TO DO
      # clean session without page reloading
      # format.js
    end
  end

  private

  def invalid_cart
    logger.error "Attempt to access invalid cart ##{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid cart'
  end

  def set_current_cart
    if session[:cart_id] == params[:id].to_i
      @cart = Cart.find(params[:id])
    else
      invalid_cart
    end
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
