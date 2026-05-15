class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit destroy update ]
  before_action :authenticate_user!, only: %i[create edit destroy update]
  before_action :authorize_staff!, only: %i[new create destroy update]
  allow_unauthenticated_access only: %i[ index show ]

   def search
    # SELECT * FROM robots WHERE name LIKE "%Robot%
    # SELECT * FROM service WHERE title LIKE "%cure"

    @results = Current.tenant.services.search(params[:q])
   end
  # GET /services or /services.json
  def index
    @services = Current.tenant.services.all
    # @services = Service.paginate(page: params[:page], per_page: 6).order("sort ASC")
  end

  # GET /services/1 or /services/1.json
  def show
    @service
    # @service = Services.paginate(page: params[:page], per_page: 4).order("sort ASC")
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Current.tenant.services.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
       @service.destroy
      redirect_to services_path, status: :see_other, notice: "Service was successfully destroyed"

    # respond_to do |format|
    #   format.html { redirect_to services_path, status: :see_other, notice: "Service was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      # @service = Service.find(params.expect(:id))
      @service = Current.tenant.services.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.expect(service: [ :title, :price, :description, :image ])
    end
end
