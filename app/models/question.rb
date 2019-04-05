class Question < ApplicationRecord
    belongs_to :category
    has_many :answers, dependet: :destroy
    has_many :exams, dependent: :destroy
end
