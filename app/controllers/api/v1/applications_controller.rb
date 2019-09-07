module Api
    module V1
        class ApplicationsController < ApplicationController::ApplicationsController

            # GET /api/v1/application?application_token=fkdshkfhdsk
            def show
               super
               render_json                 
            end

            # POST /api/v1/application
            # {
            #     "application" : {
            #         "name": "test"
            #     }
            # }
            def create
                super
                render_json                 
            end

            # PATCH /api/v1/application?applictaion_token=sdjkfdhskfs
            def update
                super
                render_json                 
            end
            
            private
            def render_json
                render json: @application 
            end
        end
    end
end
