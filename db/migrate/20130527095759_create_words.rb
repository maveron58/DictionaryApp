class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word, :null => false
      t.text :definition, :null => false
      t.integer :from_id, :null => false
      t.integer :to_id, :null => false
    end
  end
end
