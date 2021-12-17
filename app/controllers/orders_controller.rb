class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    if @user.admin?
      @orders = Order.all.order(created_at: :desc)
    else
      @orders = Order.where(user_id: current_user.id)
    end
    @order = Order.new
    @clients = Client.all
    @products = Product.all
  end

  def show
    if user.admin?
      @orders = Order.all.order(created_at: :desc)
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def new
    @order = Order.new
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
  end

  def update
    @order = Order.find(params[:id])
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

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'La venta fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end
end

private
  def order_params
    params.require(:order).permit(:category, :date, :description, :price, :client_id, :user_id, :product_id)
  end

end