class Sport < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :programs
end
