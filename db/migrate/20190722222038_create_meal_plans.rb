class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.integer :calories
      t.boolean :vegetarian, :default => false
      t.boolean :vegan, :default => false
      t.string :diet_type, :default => 'balanced'
      t.string :excluded
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
