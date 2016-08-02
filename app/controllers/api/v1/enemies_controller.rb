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
      messages = []
      messages << Attack.run(@enemy, @current_user)
      @enemy.save
      messages << "You've defeated #{@enemy.name}" if @enemy.dead?
      render json: {message: messages}
    end

    private

    def set_enemy
      @enemy = Enemy.find(params[:id])
    end
  end
end
