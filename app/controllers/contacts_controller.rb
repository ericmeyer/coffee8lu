class ContactsController < ApplicationController
  before_filter :find_contact, :except => [:index, :new, :create]
  def index
    @contacts = Contact.all
  end

  def show; end

  def new
    @contact = Contact.new
  end

  def edit; end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to(@contact, :notice => 'Contact was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to(@contact, :notice => 'Contact was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_path) }
    end
  end

private

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
