class CreateTraveldestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :traveldestinations do |t|
      t.string :location
      t.string :priority
      t.text :obstacle
      t.string :current_status
      t.text :initiate
      t.references :travellist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
