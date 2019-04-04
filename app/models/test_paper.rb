class TestPaper < ApplicationRecord
  belongs_to :exam
  belongs_to :category
  belongs_to :user
end
