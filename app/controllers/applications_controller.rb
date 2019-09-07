class ApplicationsController < ApplicationController
  before_action :set_application, only: [ :show, :update, :destroy]

  # GET /applications
  def index
    @applications = Application.all

  end

  # GET /applications/1
  def show
  end

  # POST /applications
  def create
    @application = Application.new(application_params)

    if @application.save
      @application
      # render_json
      # render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: 400
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      @application
    else
      render json: @application.errors, status: 400
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application =  Application.find_by(application_token: params[:application_token])
    end

   
    # Only allow a trusted parameter "white list" through.
    def application_params
      params.require(:application).permit(:name)

    end
end
