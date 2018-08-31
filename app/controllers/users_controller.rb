class UsersController < ApplicationController
  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])  #this brings up the form with everything filled in from database
  end

  def create
    @user = User.new(user_params)

    @user.save
    redirect_to @user   #the redirect_to is what added the article id to the url after creation to show created article

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)  #update a record that already exists
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :bio, :profilePic, :favQuote, :specialty, :years_exp)
    end
end
