class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :definition
      t.integer :from_id
      t.integer :to_id
    end
  end
end
