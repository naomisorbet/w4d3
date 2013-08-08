class ContactsController < ApplicationController

  def index
    contacts = Contact.includes(:favoriting).where(:user_id => params[:user_id]).all
    friends = []
    enemies = []
    contacts.each do |contact|
      if contact.favoriting.nil?
        enemies << contact
      else
        friends << contact
      end
    end
    sorted_contacts = friends + enemies
    render :json => sorted_contacts.to_json
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      render :json => contact.to_json
    else
      render :json => contact.errors, status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact.nil?
      redirect_to user_contacts(params[:user_id])
    else
      render :json => contact.to_json
    end
  end
  #
  def update
    contact = Contact.find(params[:id])
    params[:contact].each do |key, value|
      contact.send("#{key}=".to_sym, value)
    end
    if contact.save
      render :json => contact.to_json
    else
      render :json => contact.errors, status: :unprocessable_entity
    end
  end
  #
  def destroy
    contact = Contact.find(params[:id])
    if contact.nil?
      render :text => "No such user. . . "
    else
      contact.destroy
      render :text => "User #{params[:id]} destroyed!"
    end
  end

end
