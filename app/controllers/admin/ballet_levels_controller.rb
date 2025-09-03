module Admin
  class BalletLevelsController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_ballet_level, only: [:show, :edit, :update, :destroy]
    layout "admin"

    def index
      @ballet_levels = BalletLevel.all
    end

    def show
      @costs = @ballet_level.costs
    end

    def new
      @ballet_level = BalletLevel.new
    end

    def create
      @ballet_level = BalletLevel.new(ballet_level_params)

      if @ballet_level.save
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Ballet Level was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @ballet_level.update(ballet_level_params)
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Ballet Level was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @ballet_level.destroy
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Ballet Level was successfully destroyed." }
      end
    end

    private

    def set_ballet_level
      @ballet_level = BalletLevel.find(params[:id])
    end

    def ballet_level_params
      params.require(:ballet_level).permit(:name, :description, :picture)
    end
  end
end
