class Exam < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :test_session
    has_many :test_papers, dependent: :destroy
end
