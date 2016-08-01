module Api::V1
  class EnemiesController < ApiController

    before_action :set_enemy, only: [:show, :update, :destroy]


    def index
      @active_enemies = enemies_within_range.select { |enemy| enemy.active }
      render json: @active_enemies
    end

    def show
      render json: @enemy
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
      @enemies = Enemy.within(5, origin: [@current_user.lat, @current_user.lng])

    end
  end
end
