class ApplicationSerializer < ActiveModel::Serializer
  attributes :application_token , :name , :chats_count  
end
