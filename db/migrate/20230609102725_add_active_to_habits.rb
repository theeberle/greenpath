class AddActiveToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :active, :boolean, default: true
  end
end
