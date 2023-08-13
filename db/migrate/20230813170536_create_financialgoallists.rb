class CreateFinancialgoallists < ActiveRecord::Migration[7.0]
  def change
    create_table :financialgoallists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
