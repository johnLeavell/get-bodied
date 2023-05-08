class CreateAiMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :ai_messages do |t|
      t.string :role
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
