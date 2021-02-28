class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.integer :employee_id
      t.integer :department_id
      t.integer :historical_index
      t.string :title
      t.boolean :active

      t.timestamps
    end
  end
end
