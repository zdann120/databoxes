class Box < ApplicationRecord
  belongs_to :user
  has_secure_token
  attribute :public, :boolean, default: false
  has_many :data

  def to_param
    token
  end

  def self.find(input)
    find_by_token(input)
  end
end
