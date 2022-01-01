class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.boolean :marked, default: false
      t.text :body

      t.timestamps
    end
  end
end
