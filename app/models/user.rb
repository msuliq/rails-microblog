class User < ActiveRecord::Base
    # Adds accessors to create activation token and to remember token in cookies
    attr_accessor :remember_token, :activation_token
    before_save :downcase_email
    before_create :create_activation_digest
    validates :name, presence: true, length: { maximum: 50 }
    #custom regex to check email validity
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    # Returns digest for the string
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns random token
    def self.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers user in db for permanent session
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if token and attribute match digest 
    # Attribute is used for account activation
    # Token is used for permanent session
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    # Forgets the user
    def forget
        update_attribute(:remember_digest, nil)
    end

    private
    
        # Changes email to downcase before storing in db
        def downcase_email
            self.email = email.downcase
        end

        # Creates and assigns activation token and digest
        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end

end
