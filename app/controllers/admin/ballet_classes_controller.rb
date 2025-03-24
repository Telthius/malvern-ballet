module Admin
  class BalletClassesController < ApplicationController
    before_action :set_timetable
    before_action :set_ballet_class, only: [:show, :edit, :update, :destroy]
    layout "admin"
    def index
      @ballet_classes = BalletClass.all()
    end

    def show
      @class_times = @ballet_class.class_times.ordered
    end
  
    def new
      @ballet_class = BalletClass.new
      # @ballet_class.class_times.build
    end
  
    def create
      @ballet_class = BalletClass.new(ballet_class_params)
  
      if @ballet_class.save
        respond_to do |format|
          # format.html { admin_ballet_classes_path quotes_path, notice: "Class was successfully created." }
          format.turbo_stream { flash.now[:notice] = "Ballet Class was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @ballet_class.update(ballet_class_params)
        respond_to do |format|
          # format.html { admin_ballet_classes_path quotes_path, notice: "Class was successfully updated." }
          format.turbo_stream { flash.now[:notice] = "Ballet Class was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @ballet_class.destroy
      respond_to do |format|
        # format.html { redirect_to admin_ballet_classes_path, notice: "Ballet Class was successfully destroyed." }
        format.turbo_stream { flash.now[:notice] = "Ballet Class was successfully destroyed." }
      end
    end
  
    private
  
    def set_ballet_class
      @ballet_class = @timetable.ballet_classes.find(params[:id])
    end
 
    def set_timetable
      @timetable = Timetable.find(params[:timetable_id])
    end

    def ballet_class_params
      params.require(:ballet_class).permit(:ballet_level_id, :class_name)
    end
  end
end
