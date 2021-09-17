class Message < ApplicationRecord
    validates :author, presence: true
    validates :content, presence: true, length: { maximum: 500 }
    belongs_to :user 
    belongs_to :activity
end
