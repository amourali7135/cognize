class CreateTraumalists < ActiveRecord::Migration[7.0]
  def change
    create_table :traumalists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
