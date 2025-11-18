class CreateCastings < ActiveRecord::Migration[7.2]
  def change
    create_table :castings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :role_name

      t.timestamps
    end

    add_index :castings, [ :movie_id, :person_id, :role_name ], unique: true
  end
end
