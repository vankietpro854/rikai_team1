class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :content
<<<<<<< HEAD
=======
      t.integer :course_id
      t.string :chapter_image

>>>>>>> d142df2... Them Cours, Chapter, chinh sua layout
      t.timestamps
    end
  end
end
