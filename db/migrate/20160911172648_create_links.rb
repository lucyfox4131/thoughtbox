class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :url
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
