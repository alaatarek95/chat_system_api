class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]
  before_action :set_chat , only: [:index, :show, :create, :update]

  # GET /messages
  def index
    @messages = Message.all

  end

  # GET /messages/1
  def show
  end

  # POST /messages
  def create
        
    @message = Message.new(@chat)    
    save_to_file
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    def set_chat
      if params[:action] == "create" || params[:action] == "update"      
        @application = Application.find_by(application_token: message_params[:application_token])
        @chat = Chat.where(application_id: @application.id).where(number: message_params[:chat_number]).first     
      else
        @application = Application.find_by(application_token: params[:application_token])
        @chat = Chat.where(application_id: @application.id).where(number: params[:chat_number]).first    
      end
    end

    def save_to_file
      File.open("temp.json", "r+") do |f|
        job_objects = File.read("temp.json")
        if job_objects.empty?
          prev = {counter: 0, jobs: []}
          prev[:counter] = prev[:counter] + 1
          prev[:jobs] <<
          {
            "job_#{prev[:counter]}":{
              'job_type': 'message',
              'status': 'pending', 
              'job_args': {
                'chat_id': @chat.id,
                'body': message_params[:body],
              }
            }
          }
          
        else
          prev = JSON.parse(job_objects) 
          prev["counter"] = prev["counter"] + 1
          prev["jobs"] <<
          {
            "job_#{prev['counter']}":{
              'job_type': 'message',
              'status': 'pending', 
              'job_args': {
                'chat_id': @chat.id,
                'body': message_params[:body],
              }
            }
          }
        end
        f.write(prev.to_json)
      end
      SavingRecordJob.perform_later
      
      
      @message = {
        message_number: @message.number,
        message_body: message_params[:body] , 
      }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:chat_number, :message_number, :body, :application_token)
    end
end
