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
  
    @chat = Chat.new(@application)
    save_to_file
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
  def save_to_file
      
    File.open("temp.json", "r+") do |f|
      job_objects = File.read("temp.json")
      if job_objects.empty?
        prev = {counter: 0, jobs: []}
        prev[:counter] = prev[:counter] + 1
        prev[:jobs] <<
        {
          "job_#{prev[:counter]}":{
            'job_type': 'chat',
            'status': 'pending', 
            'job_args': {
              'application_id': @application.id,
            }
          }
        }
      else
        prev = JSON.parse(job_objects) 
        prev["counter"] = prev["counter"] + 1
        prev["jobs"] <<
        {
          "job_#{prev['counter']}":{
            'job_type': 'chat',
            'status': 'pending', 
            'job_args': {
              'application_id': @application.id,
            }
          }
        }
      end
      f.write(prev.to_json)
    end
    SavingRecordJob.perform_later
    @chat = {
      chat_number: @chat.number
    }
  end
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
