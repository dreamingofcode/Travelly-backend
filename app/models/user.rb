class User < ApplicationRecord
    has_many :user_trips
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }

end
