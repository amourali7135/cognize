class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :relationship
      t.text :blockage
      t.text :solution
      t.string :priority
      t.string :current_status
      t.references :peoplemissed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
