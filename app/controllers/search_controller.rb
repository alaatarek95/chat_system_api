class SearchController < ApplicationController
    def search
        @messages = Message.search(params[:q]).records

   end
end
