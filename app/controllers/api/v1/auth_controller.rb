class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
    def create
      @user = User.find_by(email: user_login_params[:email])
      #User#authenticate comes from BCrypt
      payload= {user_id: @user.id}
        token=JWT.encode(payload,'secret','HS256')
      if @user && @user.authenticate(user_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid email or password' }, status: :unauthorized
      end
    end

    def show
        token = request.headers[:Authorization].split(" ")[1]
        decoded_token= JWT.decode token, "secret", true,{algorithm: "HS256"}
       user_id= decoded_token[0]['user_id']
       user=User.find(user_id)
       if user
  
        render json: {id:user_id, email: user.email,name: user.name}
        # image_file_name: user.image_file_name
       else
        render json: {error: 'Invalid Token'}, status: 401
       end
    end
   
    private
   
    def user_login_params
      # params { user: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:user).permit(:email, :password)
    end
  end