module Api::V1
  class UsersController < ApiController

    def index
      render json: User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: "User saved"
      else
        render json: "User not saved"
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :api_key)
    end
  end
end
