class AddSportReferenceToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_reference :programs, :sport, null: true, foreign_key: true, index: true
  end
end
