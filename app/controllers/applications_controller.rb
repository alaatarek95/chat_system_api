class ApplicationsController < ApplicationController
  before_action :set_application, only: [ :show, :update, :destroy]

  # GET /applications
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /applications/1
  def show
    render_json   
  end

  # POST /applications
  def create
    @application = Application.new(application_params)

    if @application.save
      render_json
      # render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      render_json
    else
      render json: @application.errors, status: :unprocessable_entity
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

    # render json 
    def render_json
      render json: @application, each_serializer: ActiveModel::Serializer::ApplicationSerializer, key_transform: :underscore 
    end
    # Only allow a trusted parameter "white list" through.
    def application_params
      params.require(:application).permit(:name, :token, :chats_count)

    end
end
