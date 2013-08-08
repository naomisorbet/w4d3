class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users.to_json
  end
  #
  def create
    user = User.new(params[:user])
    if user.save
      render :json => user.to_json
    else
      render :json => user.errors, status: :unprocessable_entity
    end
  end
  #
  # def new
  # end
  #
  # def edit
  # end
  #
  def show
    user = User.find(params[:id])
    if user.nil?
      redirect_to users_url
    else
      render :json => user.to_json
    end
  end
  #
  def update
    user = User.find(params[:id])
    params[:user].each do |key, value|
      user.send("#{key}=".to_sym, value)
    end
    if user.save
      render :json => user.to_json
    else
      render :json => user.errors, status: :unprocessable_entity
    end
  end
  #
  def destroy
    user = User.find(params[:id])
    if user.nil?
      render :text => "No such user. . . "
    else
      user.destroy
      render :text => "User #{params[:id]} destroyed!"
    end
  end
end
