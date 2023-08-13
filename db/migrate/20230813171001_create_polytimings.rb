class CreatePolytimings < ActiveRecord::Migration[7.0]
  def change
    create_table :polytimings do |t|
      t.string :status
      t.references :era, polymorphic: true, null: false

      t.timestamps
    end
  end
end
