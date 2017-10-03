class Datum < ApplicationRecord
  belongs_to :box

  validates :identifier, uniqueness: {scope: :box_id}
  validates :identifier, presence: true
  validates :payload, presence: true
  #after_create :set_identifier
  #
  def as_jwt
    data = {identifier: identifier, payload: payload}
    JWT.encode(data, self.box.jwt_key, 'HS256')
  end

  private

  def set_identifier
    self.identifier = token
    self.save
  end
end
