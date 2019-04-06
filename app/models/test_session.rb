class TestSession < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :exam
  has_many :session_members, dependent: :destroy
  has_many :test_papers, dependent: :destroy
end
