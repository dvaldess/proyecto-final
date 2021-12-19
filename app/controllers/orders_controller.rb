class OrdersController < ApplicationController
  before_action :authenticate_user!
  #Añadir helper para modificar la vista del precio en la vista
  include ActionView::Helpers::NumberHelper
  def index
    @user = User.find(current_user.id)
    if @user.admin?
      @orders = Order.all.order(created_at: :desc).page params[:page]
    else
      @orders = Order.where(user_id: current_user.id).order(created_at: :desc).page params[:page]
    end
    @order = Order.new
    @clients = Client.all
    @products = Product.all
  end

  def show
    @user = User.find(current_user.id)
    if user.admin?
      @orders = Order.all.order(created_at: :desc).page params[:page]
    else
      @orders = Order.where(user_id: current_user.id).order(created_at: :desc).page params[:page]
    end
  end

  def new
    @order = Order.new
    @products = Product.all
    @order.products.build
  end

  def create
    #associate current user to order 
    @order = current_user.orders.new(order_params)
    respond_to do |format|
      if @order.save!
        format.html { redirect_to orders_path, notice: 'La venta fue creada correctamente.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
  end

  def edit
    @order = Order.find(params[:id])
    @products = Product.all
  end

  def update
    @user = User.find(current_user.id)
    @order = Order.find(params[:id])
    if user.admin? || @order.user_id == current_user.id
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to orders_path, notice: 'La venta fue actualizada correctamente.' }
          format.json { render :show, status: :ok, location: @order }
        else
          format.html { render :edit }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path, notice: 'La venta fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

private
  def order_params
    params.require(:order).permit(:category, :date, :description, :price, :client_id, :user_id, :product_id)
  end
end
end
