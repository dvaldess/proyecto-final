class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all.order(created_at: :desc).page params[:page]
    @product = Product.new
  end

  def show
    @products = Product.all.order(created_at: :desc).page params[:page]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save!
        format.html { redirect_to products_path, notice: 'El producto fue creado correctamente.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'El producto fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'El producto fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :category, :currency, :price, :order_id)
  end
end
