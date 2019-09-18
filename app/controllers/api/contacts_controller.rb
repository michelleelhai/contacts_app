class Api::ContactsController < ApplicationController
  def index
    if current_user
      @contacts = current_user.contacts
      if params[:search]
       @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR middle_name iLIKE ? OR email iLIKE ? OR bio iLIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
     end
       if params[:group]
          group = group.find_by(groups: params[:group]
          @contacts = group.contacts.where(user_id: current_user.id)
        end
     @contacts = @contacts.order(:id)
     render 'index.json.jb'
    else 
      render json: [message: "failed"]

    end
  end
  def show
  @contact = Contact.find_by(id: params[:id])
  render 'show.json.jb'
  end
  def create
   @contact = Contact.create({
    first_name: params[:first_name],
    last_name: params[:last_name], 
    middle_name: params[:middle_name],
    bio: params[:bio],
    email: params[:email],
    phone_number: params[:phone_number],
    user_id: current_user.id})
    if @contact.save
      render 'create.json.jb'
    else 
      render json: {errors: @contact.errors.full_messages},
      status: :unprocessable_entity
    end
  end
  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.bio = params[:bio] || @contact.bio
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.save
    render 'update.json.jb'
  end
  def destroy
    contact = Conntact.find_by
  
end
end
