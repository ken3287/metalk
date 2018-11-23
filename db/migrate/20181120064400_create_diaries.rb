class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|

      t.string :title, null: false
      t.text :sentence, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
