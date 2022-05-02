class User < ActiveRecord::Base
    # Adds accessor to remember token in cookies
    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    #custom regex to check email validity
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, length: { minimum: 6 }

    # Returns digest for the string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers user in db for permanent session
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true is token matches digest
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
