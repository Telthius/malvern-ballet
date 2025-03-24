module Admin
  class ClassTimesController < ApplicationController
    before_action :set_timetable
    before_action :set_ballet_class
    before_action :set_class_time, only: [:edit, :update, :destroy]
    layout "admin"
    def new
      @class_time = @ballet_class.class_times.build
    end
  
    def create
      @class_time = @ballet_class.class_times.build(class_time_params)
  
      if @class_time.save
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Class Time was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @class_time.update(class_time_params)
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = "Class Time was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @class_time.destroy
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Class Time was successfully destroyed." }
      end
    end
  
    private
  
    def class_time_params
      params.require(:class_time).permit(:day_of_week, :start_time, :end_time)
    end

    def set_ballet_class
      @ballet_class = @timetable.ballet_classes.find(params[:ballet_class_id])
    end

    def set_class_time
      @class_time = @ballet_class.class_times.find(params[:id]) 
    end

    def set_timetable
      @timetable = Timetable.find(params[:timetable_id])
    end
  end
end
