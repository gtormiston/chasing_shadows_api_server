module Api::V1
  class SessionsController < ApiController

    def create
      # p "+++++++++++"
      # p "params[:name]"
      # p params[:name]
      # p "params[:password]"
      # p params[:password]
      # p "user_params"
      # p user_params
      # p "user_params.password"
      # p user_params.password
      # p "=============="

      @user = User.find_by_name(params[:name])

      p "======="
      p @user
      # p @user.authenticate(params[:password])

      if @user && @user.authenticate(params[:password])
        render json: sanitized_user
      else
        render json: {error: "Invalid credentials"}
      end
    end

    def destroy

    end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end

    def sanitized_user
      {id: @user.id, name: @user.name, api_key: @user.api_key, email: @user.email}
    end
  end
end
