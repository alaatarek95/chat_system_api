module Api
    module V1
        class MessagesController < ApplicationController::MessagesController
            # GET /api/v1/message?application_token=fkdshkfhdsk&message_number=3
            def show
                super
                render_json                 
            end

            # GET /api/v1/message?application_token=fkdshkfhdsk
            def index
                super
                render_json                 
            end

            # POST /api/v1/message
            # {
            #     "message" : {
            #         "application_token": "fkdshkfhdsk"
            #     }
            # }
            def create
                super
                render_json                 
            end

            # PATCH /api/v1/message?application_token=fkdshkfhdsk&message_number=3
            def update
                super
                render_json                 
            end

            def search
                Message.__elasticsearch__.search(params[:q]).results

                # @message = Message.search(params[:q]).records
                render_json                 

            end
            
            
            private
            def render_json
                            
                render json: @message 
            end
        end
    end
end
