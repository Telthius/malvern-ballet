module Admin
  class CostsController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_ballet_level
    before_action :set_cost, only: [:edit, :update, :destroy]
    layout "admin"

    def new
      @cost = @ballet_level.costs.build
    end

    def create
      @cost = @ballet_level.costs.build(cost_params)

      if @cost.save
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Cost was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @cost.update(cost_params)
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Cost was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @cost.destroy
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Cost was successfully destroyed." }
      end
    end

    private

    def set_cost
      @cost = @ballet_level.costs.find(params[:id])
    end

    def set_ballet_level
      @ballet_level = BalletLevel.find(params[:ballet_level_id])
    end

    def cost_params
      params.require(:cost).permit(:amount, :condition)
    end
  end
end
