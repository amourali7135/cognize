class CreateHyptoheticals < ActiveRecord::Migration[7.0]
  def change
    create_table :hyptoheticals do |t|
      t.string :title
      t.timestamps
    end
  end
end
