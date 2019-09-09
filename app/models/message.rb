require 'elasticsearch/model'

class Message < ApplicationRecord
    attr_accessor :number
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    validates :chat_number, presence: true, allow_blank: false
    # validates :application_token, presence: true, allow_blank: false

    belongs_to :chat, class_name: "Chat", foreign_key: "chat_id"

    def initialize(chat)        
        current_chat = chat
        self.number = current_chat.messages_counter + 1  
        current_chat.messages_counter =  current_chat.messages_counter + 1  
        current_chat.save
    end
end
Message.__elasticsearch__.create_index!
Message.import

