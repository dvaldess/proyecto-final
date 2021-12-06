class ContactsController < ApplicationController
  load_and_authorize_resource
  def index
    @contacts = Contact.all.order(created_at: :desc)
    @contact = Contact.new
    @clients = Client.all
  end

  def show
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save!
        format.html { redirect_to contacts_path, notice: 'El contacto fue creado correctamente.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'El contacto fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'El contacto fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :title, :client_id)
  end
end