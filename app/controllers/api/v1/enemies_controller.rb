module Api::V1
  class EnemiesController < ApiController

    before_action :set_enemy, only: [:show, :update, :destroy]

  # GET /users
  def index
    p'================'
    @enemies = Enemy.all
    p @enemies
    render json: @enemies
  end

  # GET /users/1
  def show
    render json: @enemies
  end

  # POST /users
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     render json: [@user.name, @user.email, @user.api_key], status: :created
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /users/1
  # def destroy
  #   @user.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enemy
      @enemy = Enemy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def user_params
    #   params.require(:user).permit(:name, :email, :password)
    # end
  end
end
