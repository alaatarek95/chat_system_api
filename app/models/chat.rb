class Chat < ApplicationRecord
    belongs_to :application, class_name: "Application", foreign_key: "application_id"
    before_save :generate_chat_number
    before_save :update_chats_counter

    def generate_chat_number
        self.number = self.application.chats_count + 1            
    end

    def update_chats_counter
        
        curent_application = Application.find(self.application_id)
        curent_application.chats_count =  curent_application.chats_count + 1  
        curent_application.save
    end
    
end
