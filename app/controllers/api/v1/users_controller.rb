
module Api::V1
  class UsersController < ApiController
    # before_action :set_user, only: [:show, :destroy]

    def index
      render json: @current_user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: sanitized_user, status: :created
      else
        render json: {error: @user.errors}, status: :unprocessable_entity
      end
    end

    def update

      if @current_user.update(lat: request.headers["HTTP_USER_LATITUDE"],
                              lng: request.headers["HTTP_USER_LONGITUDE"]  )
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    # def set_user
    #   @user = User.find(params[:id])
    # end

    def user_params
      params.require(:user).permit(:name, :email, :password, :lat, :lng, :password_confirmation)
    end

    def sanitized_user
      {id: @user.id, name: @user.name, api_key: @user.api_key, email: @user.email}
    end
  end
end
