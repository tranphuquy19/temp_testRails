class User < ApplicationRecord
  include Clearance::User
  has_many :reviews , dependent: :destroy
  has_many :test_papers , dependent: :destroy
  has_many :session_members , dependent: :destroy
end
