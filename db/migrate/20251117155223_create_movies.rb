class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title,          null: false
      t.text :description
      t.integer :release_year
      t.integer :director_id

      t.timestamps
    end

    add_foreign_key :movies, :people, column: :director_id
  end
end
