class ChatSerializer < ApplicationSerializer
  attributes :application_token , :chat_number, :application_name ,:chats_count

  def application_name
    object.application&.name

  end
  def application_token
    object.application&.application_token
  end

  def chat_number
    object.number
  end

  def chats_count
    object.application&.chats_count    
  end
end
