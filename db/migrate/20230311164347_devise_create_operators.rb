# frozen_string_literal: true

class DeviseCreateOperators < ActiveRecord::Migration[7.0]
  def change
    create_table :operators do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.string :username, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :category
      t.string :phone
      t.boolean :admin
      t.boolean :manager
      t.boolean :regular

      t.timestamps null: false
    end

    add_index :operators, :email, unique: true
    add_index :operators, :username, unique: true
    add_index :operators, :reset_password_token, unique: true
  end
end
