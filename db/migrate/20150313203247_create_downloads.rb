class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :email
      t.integer :count
      t.integer :ip

      t.timestamps
    end
  end
end
