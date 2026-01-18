class BalletLevelsController < ApplicationController
  before_action :set_timetable, only: %i[ edit update destroy ]

  # GET /timetables or /timetables.json
  def index
    @ballet_classes = BalletLevel.all().order(:id)
    set_meta_tags(
      title: "Ballet Classes in Darfield - All Levels",
      description: "Explore all ballet class levels offered at Malvern Ballet School in Darfield, Canterbury. From beginner to advanced, find the perfect ballet class for you.",
      keywords: "ballet classes darfield, dance classes darfield, darfield ballet levels, darfield dance levels, RAD ballet classes darfield, ballet lessons darfield, dance lessons darfield"
    )
  end

  # GET /timetables/1 or /timetables/1.json
  def show
    @ballet_class = BalletLevel.find_by(name: params[:id])
    set_meta_tags(
      title: "#{@ballet_class&.name || 'Ballet Class'} - Darfield Ballet School",
      description: "Learn about #{@ballet_class&.name || 'our ballet class'} at Malvern Ballet School in Darfield, Canterbury. Professional RAD qualified instruction.",
      keywords: "#{@ballet_class&.name&.downcase} ballet darfield, #{@ballet_class&.name&.downcase} dance darfield, ballet class darfield, dance class darfield, darfield ballet school, darfield dance school"
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
