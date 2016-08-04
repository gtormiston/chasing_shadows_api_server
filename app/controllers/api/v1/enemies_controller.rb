require_relative '../../../../lib/attack.rb'

module Api::V1
  class EnemiesController < ApiController
    before_action :set_enemy, only: [:show, :update, :destroy]

    def index
      render json: Enemy.within_range_of(@current_user)
    end

    def show
      render json: @enemy
    end

    def update
      message = Attack.run(@enemy, @current_user)
      @enemy.save
      if message == ""
        render json: {}
      else
        render json: {error: message}
      end
    end

    private

    def set_enemy
      @enemy = Enemy.find(params[:id])
    end
  end
end
