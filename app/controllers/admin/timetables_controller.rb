module Admin
  class TimetablesController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_timetable, only: [:show, :edit, :update, :destroy]
    layout "admin"

    def index
      @timetables = Timetable.all
    end

    def show
      @ballet_classes = @timetable.ballet_classes
    end
  
    def new
      @timetable = Timetable.new
    end
  
    def create
      @timetable = Timetable.new(timetable_params)
  
      if @timetable.save
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Timetable was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @timetable.update(timetable_params)
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Timetable was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @timetable.destroy
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Timetable was successfully destroyed." }
      end
    end
  
    private
  
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end
  
    def timetable_params
      params.require(:timetable).permit(:name, :term, :start_date, :end_date) # adjust these permitted parameters based on your Timetable model attributes
    end
  end
end 