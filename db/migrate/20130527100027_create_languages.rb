class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name, :null => false
      t.boolean :from, :null => false, :default => false
      t.boolean :to, :null => false, :default => false
    end
  end
end
