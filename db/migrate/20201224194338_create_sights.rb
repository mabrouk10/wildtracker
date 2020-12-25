class CreateSights < ActiveRecord::Migration[6.0]
  def change
    create_table :sights do |t|
      t.integer :animal_id
      t.datetime :date
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
