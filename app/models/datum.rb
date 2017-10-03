class Datum < ApplicationRecord
  belongs_to :box

  validates :identifier, uniqueness: {scope: :box_id}
  validates :identifier, presence: true
  validates :payload, presence: true
  #after_create :set_identifier

  private

  def set_identifier
    self.identifier = token
    self.save
  end
end
