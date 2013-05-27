class AddForeignKesToWords < ActiveRecord::Migration
  def change
    add_foreign_key(:words, :languages, column: 'from_id')
    add_foreign_key(:words, :languages, column: 'to_id')
  end
end
