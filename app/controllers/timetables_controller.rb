class TimetablesController < ApplicationController
  before_action :set_timetable, only: %i[ edit update destroy ]

  # GET /timetables or /timetables.json
  def index
    # @first_term = Timetable.first_term
    # @second_term = Timetable.second_term
    # @third_term = Timetable.third_term
    # @fourth_term = Timetable.fourth_term
    # active_term = '4'
    # redirect_to timetable_path(id: active_term)
  end

  # GET /timetables/1 or /timetables/1.json
  def show
    @timetable = if params[:id] == 'current'
                   Timetable.current_timeable
                 else
                   Timetable.current_term_timetable(params[:id])
                 end
    @daily_classes = DailyClasses.new(@timetable)
  end

  # GET /timetables/new
  def new
    @timetable = Timetable.new
  end

  # GET /timetables/1/edit
  def edit
  end

  # POST /timetables or /timetables.json
  def create
    @timetable = Timetable.new(timetable_params)

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to timetable_url(@timetable), notice: "Timetable was successfully created." }
        format.json { render :show, status: :created, location: @timetable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timetables/1 or /timetables/1.json
  def update
    respond_to do |format|
      if @timetable.update(timetable_params)
        format.html { redirect_to timetable_url(@timetable), notice: "Timetable was successfully updated." }
        format.json { render :show, status: :ok, location: @timetable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1 or /timetables/1.json
  def destroy
    @timetable.destroy

    respond_to do |format|
      format.html { redirect_to timetables_url, notice: "Timetable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timetable_params
      params.fetch(:timetable, {})
    end
end
