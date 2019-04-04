class SessionMember < ApplicationRecord
  belongs_to :test_session
  belongs_to :user
end
