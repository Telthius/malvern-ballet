class TimetablesController < ApplicationController
  before_action :set_timetable, only: %i[ edit update destroy ]

  # GET /timetables or /timetables.json
  def index
    set_meta_tags(
      title: "Ballet Class Timetables in Darfield",
      description: "View our current ballet class timetables at Malvern Ballet School in Darfield, Canterbury. Find the perfect class time for your dance journey.",
      keywords: "ballet timetable darfield, dance timetable darfield, ballet class schedule darfield, dance class schedule darfield, darfield ballet times, darfield dance times"
    )
  end

  # GET /timetables/1 or /timetables/1.json
  def show
    if params[:id] == 'current'
      @timetable = Timetable.current_timetable
      @timetable_classes = TimetableClasses.new(@timetable)
      @current_term = @timetable.term
    else
      @timetable = Timetable.current_term_timetable(params[:id])
      @timetable_classes = TimetableClasses.new(@timetable, params[:id])
      @current_term = params[:id]
    end
    
    set_meta_tags(
      title: "Ballet Class Timetable - #{@timetable.name || @current_term} | Darfield Ballet School",
      description: "View the #{@timetable.name || @current_term} ballet class timetable at Malvern Ballet School in Darfield, Canterbury. Find class times and schedules.",
      keywords: "ballet timetable darfield, dance timetable darfield, #{@timetable.name || @current_term} ballet classes darfield, #{@timetable.name || @current_term} dance classes darfield"
    )
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
