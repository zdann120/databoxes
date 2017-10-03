class Box < ApplicationRecord
  before_create :set_jwt_key
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

  def regenerate_jwt_key
    set_jwt_key
    save
  end

  def decode_jwt(jwt)
    JWT.decode(jwt, self.jwt_key, true, { algorithm: 'HS256' }).try(:first)
  end

  private

  def set_jwt_key
    self.jwt_key = SecureRandom.uuid
  end
end
