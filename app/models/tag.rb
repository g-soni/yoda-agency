class Tag < ApplicationRecord
  belongs_to :agency

  validates :name, presence: true

end
