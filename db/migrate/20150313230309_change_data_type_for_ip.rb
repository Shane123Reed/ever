class ChangeDataTypeForIp < ActiveRecord::Migration
  def self.up
    change_table :downloads do |t|
      t.change :ip, :string
    end
  end
  def self.down
    change_table :downloads do |t|
      t.change :ip, :integer
    end
  end   

end