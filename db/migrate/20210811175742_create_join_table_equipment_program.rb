class CreateJoinTableEquipmentProgram < ActiveRecord::Migration[6.1]
  def change
    create_join_table :equipment, :programs do |t|
      t.index [:program_id, :equipment_id], unique: true
    end
  end
end
