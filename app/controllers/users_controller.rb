class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
    @user = User.update
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end
end
