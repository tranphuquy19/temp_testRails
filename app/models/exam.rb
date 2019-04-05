class Exam < ApplicationRecord
    belongs_to :category
    belongs_to :question
    has_many :test_sessions , dependent: :destroy
    has_many :test_papers , dependent: :destroy
    
end
