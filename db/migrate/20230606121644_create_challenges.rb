class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.float :saving_carbonamount
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
