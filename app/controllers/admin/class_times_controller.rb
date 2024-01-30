module Admin
  class ClassTimesController < ApplicationController
    before_action :set_ballet_class
    layout "admin"
    def new
      @class_time = @ballet_class.class_times.build
    end
  
    def create
      @class_time = @ballet_class.class_times.build(class_time_params)
  
      if @class_time.save
        redirect_to admin_ballet_class_path(@ballet_class), notice: "Date was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def class_time_params
      params.require(:class_time).permit(:timetable_id, :day_of_week, :start_time, :end_time)
    end

    def set_ballet_class
      @ballet_class = BalletClass.find(params[:ballet_class_id])
    end
  end
end
