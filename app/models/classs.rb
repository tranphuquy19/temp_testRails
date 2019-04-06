class Classs < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :class_members, dependent: :destroy
end
