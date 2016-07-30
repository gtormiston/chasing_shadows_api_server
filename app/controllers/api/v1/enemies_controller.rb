module Api::V1
  class EnemiesController < ApiController

    before_action :set_enemy, only: [:show, :update, :destroy]

    DEFAULT_RANGE = 5

    def index
      @active_enemies = enemies_within_range.select { |enemy| enemy.active }
      render json: @active_enemies
    end

    def show
      render json: @enemies
    end


    def update
      @enemy.size -= 1 if enemies_within_range.include? @enemy
      @enemy.active = false if @enemy.size <= 0
      @enemy.save
    end


  private

    def set_enemy
      @enemy = Enemy.find(params[:id])
    end

    def enemies_within_range
      @current_location =  UserLocation.where(user_id: @current_user.id)[0]
      @enemies = Enemy.within(5, origin: [@current_location.lat, @current_location.lng])

    end
  end
end
