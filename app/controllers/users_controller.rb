class UsersController < ApplicationController
  before_action :is_admin?, only: [:destroy]
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.update
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
        redirect_to root_path, notice: "Account wurde gelöscht."
    end
  end
end
