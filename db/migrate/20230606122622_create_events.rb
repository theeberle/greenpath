class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :status
      t.date :due_date
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
