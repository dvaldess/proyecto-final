class ClientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @clients = Client.all.order(created_at: :desc)
    @client = Client.new
  end

  def show
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save!
        format.html { redirect_to clients_path, notice: 'El cliente fue creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'El cliente fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'El cliente fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private

  def client_params
    params.require(:client).permit(:rut, :name, :address, :phone, :category)
  end

end
