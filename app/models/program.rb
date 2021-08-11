class Program < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :equipment_programs
  has_many :equipments, through: :equipment_programs
end
