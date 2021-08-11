class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :name, null: false, index: {unique: true}
      t.boolean :womens, null: true, default: false
      t.timestamps
    end
  end
end
