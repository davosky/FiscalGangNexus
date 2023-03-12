class Operator < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :requests
end
