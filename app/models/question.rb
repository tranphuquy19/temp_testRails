class Question < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :answers, dependet: :destroy
    has_many :exam_qu, dependent: :destroy
end
