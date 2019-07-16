class CreateSuports < ActiveRecord::Migration[5.2]
  def change
    create_table :suports do |t|
      t.string :name
      t.string :emai
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
