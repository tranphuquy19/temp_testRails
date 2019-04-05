class TestSession < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :exam
  has_many :session_member, dependent: :destroy
end
