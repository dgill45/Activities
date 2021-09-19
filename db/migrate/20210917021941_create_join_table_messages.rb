class CreateJoinTableMessages < ActiveRecord::Migration[6.1]
  def change
    create_join_table :messages do |t|
      t.string :author
      t.string :content 

      t.timestamp
      add_foreign_key :messages, :user_id
      add_foreign_key :messages, :activity_id
    end
  end
end
