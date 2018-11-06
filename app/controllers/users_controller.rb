class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    # check to see if @test is used when rendering users/new
    @test = "hola"
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      # can send errors as instance variable or access errors from the view
      # @errors = @user.errors.full_messages
      render 'users/new'
      # different from redirect_to "/users/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
