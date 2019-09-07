class Application < ApplicationRecord
    validates_uniqueness_of :application_token
    validates :name, format: { with:  /\A[a-zA-Z]+\z/ ,message: "only allows letters and digits" }
    has_secure_token :application_token
    has_many :chats, class_name: "Chat", foreign_key: "application_id"

end
