class CreateFinancialsituations < ActiveRecord::Migration[7.0]
  def change
    create_table :financialsituations do |t|
      t.boolean :happy
      t.text :summary
      t.text :obstacle
      t.text :initiate
      t.text :priority
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
