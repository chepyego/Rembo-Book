class ManicuristsController < ApplicationController
  before_action :authorize_staff!, only: %i[create update edit destroy]
  before_action :authenticate_user!, only: %i[create index show update edit destroy ]
  before_action :set_manicurist, only: %i[ show edit update destroy ]

  # GET /manicurists or /manicurists.json
  def index
    @manicurists = Current.tenant.manicurists.all
  end

  # GET /manicurists/1 or /manicurists/1.json
  def show
  end

  # GET /manicurists/new
  def new
    @manicurist = Current.tenant.manicurists.build
  end

  # GET /manicurists/1/edit
  def edit
  end

  # POST /manicurists or /manicurists.json
  def create
    @manicurist = Current.tenant.manicurists.build(manicurist_params)

    respond_to do |format|
      if @manicurist.save
        format.html { redirect_to @manicurist, notice: "Manicurist was successfully created." }
        format.json { render :show, status: :created, location: @manicurist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manicurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manicurists/1 or /manicurists/1.json
  def update
    respond_to do |format|
      if @manicurist.update(manicurist_params)
        format.html { redirect_to @manicurist, notice: "Manicurist was successfully updated." }
        format.json { render :show, status: :ok, location: @manicurist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manicurist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manicurists/1 or /manicurists/1.json
  def destroy
    @manicurist.destroy!

    respond_to do |format|
      format.html { redirect_to manicurists_path, status: :see_other, notice: "Manicurist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manicurist
      @manicurist = Current.tenant.manicurists.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def manicurist_params
      params.expect(manicurist: [ :first_name, :last_name, :phone, :experience, :user_id, :manicurist_image ])
    end
end
