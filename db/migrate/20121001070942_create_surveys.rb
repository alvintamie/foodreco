class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id

      t.hstore  :education
      t.hstore  :occupation

      t.integer :age_from_facebook
      t.string  :age_range

      t.string  :religion_from_facebook
      t.string  :religion

      t.integer :friends_count_from_facebook
      t.string  :friends_count_range

      t.string  :gender_from_facebook
      t.string  :gender

      t.string  :name

      t.integer :annual_salary_range

      t.string  :relationship_status_from_facebook
      t.string  :relationship_status


      t.timestamps
    end
  end
end
