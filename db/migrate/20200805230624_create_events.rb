class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.date :promote_on
      t.string :description, limit: 400

      t.timestamps
    end
  end
end
