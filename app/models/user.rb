class User < ApplicationRecord
  include Clearance::User
  has_many :reviews, dependent: :destroy
end
