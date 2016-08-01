
module Api::V1
  class UsersController < ApiController
    before_action :set_user, only: [:show, :destroy]

    def index
      render json: @current_user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: sanitized_user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      p "IN UPDATE ROUTE-"
      p "LAT:"
      p request.headers["HTTP_USER_LOCATION"].lat
      p "JSON?!?!?"
      p JSON.parse(request.headers["HTTP_USER_LOCATION"])
      if @current_user.update(lat: request.headers["HTTP_USER_LOCATION"]["lat"],
                              lng: request.headers["HTTP_USER_LOCATION"]["lng"]  )
      else
        p "FAIL"
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :lat, :lng, :password_confirmation)
    end

    def sanitized_user
      {id: @user.id, name: @user.name, api_key: @user.api_key, email: @user.email}
    end
  end
end
