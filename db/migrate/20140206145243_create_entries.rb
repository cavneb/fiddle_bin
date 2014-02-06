class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :site
      t.string :description
      t.string :remote_id
      t.integer :revision
      t.string :username
      t.string :user_id

      t.timestamps
    end

    add_index :entries, :user_id
  end
end
