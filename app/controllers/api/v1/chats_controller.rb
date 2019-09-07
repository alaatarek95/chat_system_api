module Api
    module V1
        class ChatsController < ApplicationController::ChatsController

            # GET /api/v1/chat?application_token=fkdshkfhdsk&chat_number=3
            def show
                super
                render_json                 
            end

            # GET /api/v1/chat?application_token=fkdshkfhdsk
            def index
                super
                render_json                 
            end

            # POST /api/v1/chat
            # {
            #     "chat" : {
            #         "application_token": "fkdshkfhdsk"
            #     }
            # }
            def create
                super
                render_json                 
            end

            # PATCH /api/v1/chat?application_token=fkdshkfhdsk&chat_number=3
            def update
                super
                render_json                 
            end
            
            private
            def render_json
                            
                render json: @chat 
            end
        end
    end
end
