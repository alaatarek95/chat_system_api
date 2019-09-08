class MessageSerializer < ApplicationSerializer
  attributes :message_number , :message_body

  def message_body
    object.body
  end

  def message_number
    object.number
  end
end
