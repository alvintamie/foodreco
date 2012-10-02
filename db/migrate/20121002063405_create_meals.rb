class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :survey_id
      t.integer :user_id
      t.string  :day
      t.string  :price 
      t.integer :hour
      t.string  :recommended
      t.string  :place
      t.string  :cuisine
      t.timestamps
    end
  end
end
