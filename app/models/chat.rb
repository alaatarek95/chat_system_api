class Chat < ApplicationRecord
    belongs_to :application, class_name: "Application", foreign_key: "application_id"
    # validates :application_token, presence: true, allow_blank: false
    attr_accessor :number

    def initialize(application)       
        
         
        current_application = application
        self.number = current_application.chats_count + 1  
        current_application.chats_count =  current_application.chats_count + 1  
        current_application.save
    end
    
end
