class Boards < ActiveRecord::Migration[5.1]

  def self.up
      create_table :boards do |t|
        t.column :game_sts , :string , :limit => 9 , :null => false
        t.column :winner , :integer
      end
  end

  def self.down
    drop_table :boards
  end

end
