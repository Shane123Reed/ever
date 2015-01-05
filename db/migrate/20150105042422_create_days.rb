class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.text :question1
      t.text :question2
      t.text :question3
      t.string :image

      t.timestamps
    end
  end
end
