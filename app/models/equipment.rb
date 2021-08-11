class Equipment < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :equipment_programs
  has_many :programs, through: :equipment_programs
end
