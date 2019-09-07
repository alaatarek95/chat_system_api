class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.integer :messages_counter , default: 0
      t.references :application, index: true, null: false

      t.timestamps
    end
    add_index :chats, :number
    add_foreign_key :chats, :applications

  end
end
