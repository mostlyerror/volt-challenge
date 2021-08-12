class ProgramSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :sport
  has_many :equipments, key: :required_equipment
end