class User < ActiveRecord::Base
    has_many :microposts, dependent: :destroy
    # Definition for relationship with user's followers
    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
    # Definition for relationship with who the user follows
    has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    # Source is shown since there is no adequate plural form for followed
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships

    # Adds accessors to create activation token,
    # remember and reset password token
    attr_accessor :remember_token, :activation_token, :reset_token
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

    # Activates user account
    def activate
        update_columns(activated: true, activated_at: Time.zone.now)
    end

    # Sends email with link to activation page
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    # Sets attributes for password reset
    def create_reset_digest
        self.reset_token = User.new_token
        update_columns(reset_digest: User.digest(reset_token),
                       reset_sent_at: Time.zone.now)
    end
    
    # Sends email with link to the password reset form
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # Returns true if password link expired
    def password_reset_expired?
        reset_sent_at < 2.hours.ago 
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

    # Returns feed, sql subquery is applied for scaling
    def feed
        following_ids = "SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id"
        Micropost.where("user_id IN (#{following_ids})
                        OR user_id = :user_id", user_id: id)
    end

    # Establishes follow relationship
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

    # Destroys follow relationship
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # Returns true if current user is a follower
    def following?(other_user)
        following.include?(other_user)
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
