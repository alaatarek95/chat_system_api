class ApplicationSerializer < ActiveModel::Serializer
  attributes :application_token , :application_name , :chats_count  
  # has_many :chats
  def application_name
    object.name

  end

end
