class Category < ApplicationRecord
  has_many :requests

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "position", "updated_at"]
  end
end
