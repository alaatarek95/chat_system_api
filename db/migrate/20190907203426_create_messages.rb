class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.text :body
      t.references :chat, index: true, null: false

      t.timestamps
    end
    add_index :messages, :number
    add_index :messages, :body , length: 10

    add_foreign_key :messages, :chats
  end
end
