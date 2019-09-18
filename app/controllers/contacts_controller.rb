class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'index.html.erb'    
  end
  def show 
    @contact = Contact.find_by(id: params[:id])
    render 'show.html.erb'
  end
  def new
    render 'new.html.erb'
  end
  def create
    @contact = Contact.create({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      middle_name: params[:middle_name],
      bio: params[:bio],
      user_id: params[:user_id]
    })
    @contact.save
    redirect_to "/contacts"
  end
  def edit
    @contact = Contact.find_by(id: params[:id])
    render 'edit.html.erb'
  end
end
