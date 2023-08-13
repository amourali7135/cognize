class CreatePolypriorities < ActiveRecord::Migration[7.0]
  def change
    create_table :polypriorities do |t|
      t.string :level
      t.references :priority, polymorphic: true, null: false

      t.timestamps
    end
  end
end
