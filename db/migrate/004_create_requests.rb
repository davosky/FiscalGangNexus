class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :name
      t.date :date
      t.references :practice, null: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :email
      t.boolean :subscriber
      t.references :category, null: true, foreign_key: true
      t.text :note
      t.references :operator, null: true, foreign_key: true
      t.boolean :processed, default: false
      t.string :updater
      t.boolean :unprocessable, default: false
      t.string :unprocessable_reason
      t.boolean :first_call
      t.boolean :second_call
      t.boolean :third_call
      t.date :first_call_date
      t.date :second_call_date
      t.date :third_call_date
      t.string :first_call_updater
      t.string :second_call_updater
      t.string :third_call_updater

      t.timestamps
    end
  end
end
