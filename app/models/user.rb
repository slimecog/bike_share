class User < ApplicationRecord
    has_secure_password
    validates_presence_of :name
    validates :email, presence: true, uniqueness: true
    enum role: %w(default admin)
end
