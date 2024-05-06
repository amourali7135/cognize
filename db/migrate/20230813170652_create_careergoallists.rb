class CreateCareergoallists < ActiveRecord::Migration[7.0]
  def change
    create_table :careergoallists do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
