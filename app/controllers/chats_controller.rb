class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :set_application , only: [:index, :show, :create, :update]


  # GET /chats
  def index
    @chats = Chat.all

  end

  # GET /chats/1
  def show
  end

  # POST /chats
  def create      
    @chat = Chat.new
    @chat.application_id = @application.id
    if @chat.save
      @chat
    else
      render json: @chat.errors, status: 400
    end
  end

  # PATCH/PUT /chats/1
  def update
    @chat = Chat.find_by(number: chat_params[:chat_number])
    @chat.application_id = @application.id
    if @chat.update
      @chat
    else
      render json: @chat.errors, status: 400
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.where("number = ? and application_id = ?", params[:chat_number], @application.id).first
    end
    def set_application
      
      if params[:action] == "create" || params[:action] == "update"
      
        @application = Application.find_by(application_token: chat_params[:application_token])     
      else
        @application = Application.find_by(application_token: params[:application_token])     

      end
    end

    # Only allow a trusted parameter "white list" through.
    def chat_params
      params.require(:chat).permit(:chat_number, :application_token)

    end
end
