class Exam < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :test_papers, dependent: :destroy
end
