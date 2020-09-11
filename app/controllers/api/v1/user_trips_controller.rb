class Api::V1::UserTripsController < ApplicationController
 
    def index 
        @user_trip= UserTrips.all 
        render json: @users
    end

    
     def create
        @user_trip= UserTrips.create(trip_params)
    if @user_trip.valid?
      render json: { trip: @user_trip }, status: :created
    else
      render json: { error: 'failed to create trip model, please try again!' }, status: :not_acceptable
    end
  end
 
  def update
    @user_trip= user_trip.find_by(id: params[:id])
    if @user_trip.update(trip_params)
        render json:@user_trip
    else
      
        render json: {error: 'Failed to UPDATE trip, check credentials and try again!'}, status: :not_acceptable
    end
  end
  def destroy
    @user_trip=user_trip.find_by(id:params[:id])
    @user.destroy
    render json: @user
  end

  private
  def trip_params
    params.require(:trip).permit(:tripName,:tripDestination,:tripStart,:tripEnd ,:flight,
        :hotel, 
        :todo,:user_id)
  end

end