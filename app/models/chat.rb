class Chat < ApplicationRecord
    belongs_to :application, class_name: "Application", foreign_key: "application_id"
    # validates :application_token, presence: true, allow_blank: false

    def initialize(application_id=nil) 
               
        if !application_id.nil?
            current_application = Application.find(application_id)
            number = current_application.chats_count + 1  
            current_application.chats_count =  current_application.chats_count + 1  
            current_application.save
        end
    end
    
end
