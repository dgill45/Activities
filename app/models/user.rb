class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, { :length => { :minimum => 2 } }
    validates :email, presence: true, uniqueness: true
    has_many :messages
    has_many :activities, through: :messages
end
