class CreateDetailCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :detail_courses do |t|
      t.references :user, foreign_key: true
      t.references :cour, foreign_key: true
      t.date :begin
      t.date :end
      t.timestamps
    end
  end
end
