class Application < ApplicationRecord
    validates_uniqueness_of :application_token
    validates :name, format: { with:  /\A[a-zA-Z]+\z/ ,
        message: "only allows letters and digits" }
    # before_create :generate_token
    has_secure_token :application_token

    # protected
  
    # def generate_token
    #   self.token = loop do
    #     random_token = SecureRandom.urlsafe_base64(nil, false)
    #     break random_token unless Application.exists?(token: random_token)
    #   end
    # end

end
