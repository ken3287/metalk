class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|

      t.string :title, null: false
      t.text :sentence, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
