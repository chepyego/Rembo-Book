class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create edit show update destroy]
  before_action :authorize_staff!, only: %i[create destroy new update]
  before_action :set_schedule, only: %i[show edit update destroy]
  def index
    @schedules = Current.tenant.schedules.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Current.tenant.schedules.build
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Current.tenant.schedules.build(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy!

    respond_to do |format|
      format.html { redirect_to schedules_path, status: :see_other, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Current.tenant.schedules.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.expect(schedule: [ :title, :start, :end, :manicurist_id ])
    end
end
