class CreateMealLog < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_logs do |t|
      t.string :name
      t.date :meal_date
      t.time :meal_time
      t.integer :meal_calories
      t.integer :meal_fats
      t.integer :meal_carbs
      t.integer :meal_sugars
      t.integer :meal_protein
      t.integer :meal_sodium
    end
  end
end
