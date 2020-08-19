class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy,:put,:update]

    def index 
        @users= User.all 
        render json: @users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end
 1    
     def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user, check credentials and try again!' }, status: :not_acceptable
    end
  end
 
  def update
    @user= User.find_by(id: params[:id])
    if @user.update(user_params_update)
        render json:@user
    else
      
        render json: {error: 'Failed to UPDATE User, check credentials and try again!'}, status: :not_acceptable
    end
  end
  def destroy
    @user=User.find_by(id:params[:id])
    @user.destroy
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:name,:email, :password,:DOB,:address)
  end
  private
def user_params_update
    params.require(:user).permit(:name,:email,:DOB,:address)

end
end