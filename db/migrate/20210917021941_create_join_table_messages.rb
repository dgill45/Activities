class CreateJoinTableMessages < ActiveRecord::Migration[6.1]
  def change
    create_join_table(:messages, :users, :activities) do |t|
      t.string :author
      t.string :content 

      t.timestamp
      add_foreign_key :messages, :users
      add_foreign_key :messages, :activities

  end
end
