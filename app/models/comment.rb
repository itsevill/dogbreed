class Comment < ApplicationRecord
    belongs_to :breed

    validates :email, presence: true
    validates :comment, presence: true
end
