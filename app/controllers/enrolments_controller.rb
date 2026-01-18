class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: %i[ show edit update destroy ]

  # GET /enrolments/1 or /enrolments/1.json
  def show
  end

  # GET /enrolments/new
  def new
    @enrolment = Enrolment.new
  end

  # GET /enrolments/1/edit
  def edit
  end

  # POST /enrolments or /enrolments.json
  def create
    @enrolment = Enrolment.new(enrolment_params)

    respond_to do |format|
      if @enrolment.save
        @enrolment.send_enrolment_interest_email
        format.turbo_stream { 
          render turbo_stream: turbo_stream.replace("enrolment-form-container", partial: "enrolments/success_message")
        }
        format.html { 
          redirect_to new_enrolment_path, notice: "Thank you! Your application has been submitted successfully. We'll be in touch soon." 
        }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("enrolment-form", partial: "enrolments/form", locals: { enrolment: @enrolment })
        }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolments/1 or /enrolments/1.json
  def update
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        format.html { redirect_to enrolment_url(@enrolment), notice: "Enrolment was successfully updated." }
        format.json { render :show, status: :ok, location: @enrolment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1 or /enrolments/1.json
  def destroy
    @enrolment.destroy

    respond_to do |format|
      format.html { redirect_to new_enrolment_url, notice: "Enrolment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment
      @enrolment = Enrolment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrolment_params
      params.require(:enrolment).permit(:name, :email, :age_of_child, :any_prior_experience, :comments_and_queries)
    end
end
